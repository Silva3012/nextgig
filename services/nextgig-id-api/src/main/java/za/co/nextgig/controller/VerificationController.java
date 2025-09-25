package za.co.nextgig.controller;

import jakarta.validation.Valid;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import za.co.nextgig.model.VerificationResult;
import za.co.nextgig.dto.reponse.CVAnalysisResponse;
import za.co.nextgig.dto.reponse.IDVerificationResponse;
import za.co.nextgig.dto.reponse.VerificationResponse;
import za.co.nextgig.dto.request.VerificationRequest;
import za.co.nextgig.utils.VerificationResultUtil;
import za.co.nextgig.utils.VerificationUtil;

import java.util.concurrent.CompletableFuture;

/**
 * @author NMMkhungo
 * @since 2025/09/25
 **/

@Slf4j
@RestController
@RequestMapping("/api/sa-id")
@CrossOrigin(origins = "*")
public class VerificationController {
    private final VerificationUtil verificationUtil;
    private final VerificationResultUtil resultService;

    @Autowired
    public VerificationController(VerificationUtil verificationUtil,
                                  VerificationResultUtil resultService) {
        this.verificationUtil = verificationUtil;
        this.resultService = resultService;
    }

    @PostMapping("/verify")
    public ResponseEntity<VerificationResponse> verifyDocuments(
            @Valid @ModelAttribute VerificationRequest request) {

        try {
            CompletableFuture<VerificationResult> futureResult = verificationUtil.processVerification(
                    request.getIdImage(),
                    request.getCvFile(),
                    request.getPortfolioLinks(),
                    request.getUserId()
            );

            VerificationResult result = futureResult.get();
            VerificationResponse response = mapToResponse(result);

            return ResponseEntity.ok(response);

        } catch (Exception e) {
            log.error("Verification request failed", e);
            return ResponseEntity.internalServerError().build();
        }
    }

    @GetMapping("/result/{verification-id}")
    public ResponseEntity<VerificationResponse> getVerificationResult(
            @PathVariable String verificationId) {

        VerificationResult result = resultService.getResult(verificationId);
        if (result == null) {
            return ResponseEntity.notFound().build();
        }

        return ResponseEntity.ok(mapToResponse(result));
    }

    private VerificationResponse mapToResponse(VerificationResult result) {
        VerificationResponse response = new VerificationResponse();
        response.setVerificationId(result.getVerificationId());
        response.setStatus(result.getStatus().toString());
        response.setConfidenceScore(result.getConfidenceScore());

        // Map ID verification
        if (result.getIdVerification() != null) {
            IDVerificationResponse idResponse =
                    new IDVerificationResponse();
            idResponse.setIdNumber(result.getIdVerification().getIdNumber());
            idResponse.setValidFormat(result.getIdVerification().getIsVerified());
            idResponse.setExtractedNames(result.getIdVerification().getExtractedNames());

            if (result.getIdVerification().getValidationResult() != null) {
                idResponse.setBirthDate(result.getIdVerification().getValidationResult().getBirthDate());
                idResponse.setCitizenship(result.getIdVerification().getValidationResult().getCitizenship());
                idResponse.setChecksumValid(result.getIdVerification().getValidationResult().getChecksumValid());
            }

            response.setIdVerification(idResponse);
        }

        // Map CV analysis
        if (result.getCvAnalysis() != null) {
            CVAnalysisResponse cvResponse =
                    new CVAnalysisResponse();
            cvResponse.setQualityScore(result.getCvAnalysis().getQualityScore());
            cvResponse.setSkills(result.getCvAnalysis().getSkills());
            response.setCvAnalysis(cvResponse);
        }

        return response;
    }
}
