package za.co.nextgig.dto.reponse;

import lombok.Data;

/**
 * @author NMMkhungo
 * @since 2025/09/25
 **/
@Data
public class VerificationResponse {
    private String verificationId;
    private String status;
    private IDVerificationResponse idVerification;
    private CVAnalysisResponse cvAnalysis;
    private PortfolioVerificationResponse portfolioVerification;
    private Double confidenceScore;
    private String message;
}
