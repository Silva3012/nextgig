package za.co.nextgig.utils;

import com.google.cloud.vision.v1.*;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import za.co.nextgig.model.IDValidationResult;
import za.co.nextgig.model.IDVerificationResult;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Pattern;
import java.util.regex.Matcher;

/**
 * @author NMMkhungo
 * @since 2025/09/25
 **/
@Slf4j
@Component
public class SAIDVerificationUtil {
    private final ImageAnnotatorClient visionClient;
    private static final Pattern ID_PATTERN = Pattern.compile("\\b\\d{13}\\b");
    private static final Pattern NAME_PATTERN = Pattern.compile("([A-Z][a-z]+(?: [A-Z][a-z]+)+)");

    @Autowired
    public SAIDVerificationUtil(ImageAnnotatorClient visionClient) {
        this.visionClient = visionClient;
    }

    public IDVerificationResult verifyID(byte[] imageData) {
        try {
            String extractedText = extractTextFromImage(imageData);
            IDVerificationResult result = parseIDText(extractedText);
            result.setValidationResult(validateSAID(result.getIdNumber()));
            result.setIsVerified(result.getValidationResult().getValid());
            return result;
        } catch (Exception e) {
            log.error("Error during ID verification", e);
            throw new RuntimeException("ID verification failed", e);
        }
    }

    private String extractTextFromImage(byte[] imageData) throws IOException {
        Image image = Image.newBuilder().setContent(com.google.protobuf.ByteString.copyFrom(imageData)).build();
        AnnotateImageRequest request = AnnotateImageRequest.newBuilder()
                .addFeatures(Feature.newBuilder().setType(Feature.Type.TEXT_DETECTION))
                .setImage(image)
                .build();

        BatchAnnotateImagesResponse response = visionClient.batchAnnotateImages(List.of(request));
        AnnotateImageResponse imageResponse = response.getResponsesList().get(0);

        if (imageResponse.hasError()) {
            throw new IOException("Vision API error: " + imageResponse.getError().getMessage());
        }

        return imageResponse.getTextAnnotationsList().isEmpty() ?
                "" : imageResponse.getTextAnnotationsList().get(0).getDescription();
    }

    private IDVerificationResult parseIDText(String text) {
        IDVerificationResult result = new IDVerificationResult();
        result.setRawText(text);

        // Extract ID number
        Matcher idMatcher = ID_PATTERN.matcher(text);
        if (idMatcher.find()) {
            result.setIdNumber(idMatcher.group());
        }

        // Extract names
        Matcher nameMatcher = NAME_PATTERN.matcher(text);
        List<String> names = new ArrayList<>();
        while (nameMatcher.find()) {
            names.add(nameMatcher.group());
        }
        result.setExtractedNames(names);

        return result;
    }

    private IDValidationResult validateSAID(String idNumber) {
        IDValidationResult result = new IDValidationResult();

        if (idNumber == null || idNumber.length() != 13) {
            result.setValid(false);
            result.setReason("Invalid ID length");
            return result;
        }

        // Validate birth date
        String birthDateResult = extractBirthDate(idNumber.substring(0, 6));
        result.setBirthDate(birthDateResult);
        result.setBirthDateValid(isValidDate(birthDateResult));

        // Validate citizenship (7th digit)
        result.setCitizenship(parseCitizenship(idNumber.charAt(10)));

        // Validate checksum using Luhn algorithm
        result.setChecksumValid(validateLuhnChecksum(idNumber));

        result.setValid(result.getChecksumValid() && result.getBirthDateValid());
        result.setReason(result.getValid() ? "Valid SA ID" : "Invalid SA ID");

        return result;
    }

    private String extractBirthDate(String dateStr) {
        try {
            int year = Integer.parseInt(dateStr.substring(0, 2));
            int month = Integer.parseInt(dateStr.substring(2, 4));
            int day = Integer.parseInt(dateStr.substring(4, 6));

            // Determine century
            int currentYear = LocalDate.now().getYear() % 100;
            int century = year <= currentYear ? 2000 : 1900;
            int fullYear = century + year;

            return String.format("%04d-%02d-%02d", fullYear, month, day);
        } catch (Exception e) {
            return "Invalid date";
        }
    }

    private boolean isValidDate(String dateStr) {
        try {
            LocalDate.parse(dateStr, DateTimeFormatter.ISO_DATE);
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    private String parseCitizenship(char digit) {
        return digit == '0' ? "South African Citizen" : "Permanent Resident";
    }

    private boolean validateLuhnChecksum(String idNumber) {
        try {
            int sum = 0;
            boolean alternate = false;

            for (int i = idNumber.length() - 1; i >= 0; i--) {
                int digit = Character.getNumericValue(idNumber.charAt(i));

                if (alternate) {
                    digit *= 2;
                    if (digit > 9) {
                        digit = (digit % 10) + 1;
                    }
                }

                sum += digit;
                alternate = !alternate;
            }

            return (sum % 10) == 0;
        } catch (Exception e) {
            return false;
        }
    }
}
