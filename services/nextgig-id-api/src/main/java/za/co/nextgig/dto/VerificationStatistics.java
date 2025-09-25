package za.co.nextgig.dto;

import lombok.Data;

/**
 * @author NMMkhungo
 * @since 2025/09/25
 **/
@Data
public class VerificationStatistics {
    private long totalVerifications;
    private long completedCount;
    private long pendingCount;
    private long failedCount;
    private double averageConfidenceScore;

}
