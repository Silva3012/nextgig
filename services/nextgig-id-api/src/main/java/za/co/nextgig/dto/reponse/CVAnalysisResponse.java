package za.co.nextgig.dto.reponse;

import lombok.Data;

import java.util.List;

/**
 * @author NMMkhungo
 * @since 2025/09/25
 **/
@Data
public class CVAnalysisResponse {
    private Double qualityScore;
    private List<String> skills;
    private String summary;
}
