package za.co.nextgig.model;

import lombok.Data;

import java.util.List;

/**
 * @author NMMkhungo
 * @since 2025/09/25
 **/
@Data
public class IDVerificationResult {
    private String idNumber;
    private List<String> extractedNames;
    private String rawText;
    private IDValidationResult validationResult;
    private Boolean isVerified;
}
