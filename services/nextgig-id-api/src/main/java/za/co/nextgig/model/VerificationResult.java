package za.co.nextgig.model;

import lombok.Data;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;
import za.co.nextgig.enums.VerificationStatus;

import java.time.LocalDateTime;

/**
 * @author NMMkhungo
 * @since 2025/09/25
 **/
@Data
@Document(collection = "verifications")
public class VerificationResult {
    @Id
    private String id;
    private String verificationId;
    private String userId;
    private LocalDateTime timestamp;
    private IDVerificationResult idVerification;
    private CVAnalysisResult cvAnalysis;
    private PortfolioVerificationResult portfolioVerification;
    private Double confidenceScore;
    private VerificationStatus status;
    private String ipAddress;
    private String userAgent;
}


