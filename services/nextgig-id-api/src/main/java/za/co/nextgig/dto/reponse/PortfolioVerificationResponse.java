package za.co.nextgig.dto.reponse;

import lombok.Data;

import java.util.Map;

/**
 * @author NMMkhungo
 * @since 2025/09/25
 **/
@Data
public class PortfolioVerificationResponse {
    private Integer totalLinks;
    private Integer accessibleLinks;
    private Map<String, Boolean> linkStatus;
}
