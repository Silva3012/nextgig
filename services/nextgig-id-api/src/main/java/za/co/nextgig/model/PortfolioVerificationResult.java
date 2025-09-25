package za.co.nextgig.model;

import lombok.Data;

import java.util.Map;

/**
 * @author NMMkhungo
 * @since 2025/09/25
 **/
@Data
public class PortfolioVerificationResult {
    private Map<String, LinkVerificationResult> links;
    private Integer accessibleLinksCount;
    private Integer totalLinksCount;
    private Double successRate;
    private Double averageLoadTime;
}
