package za.co.nextgig.model;

import lombok.Data;

import java.util.List;
import java.util.Map;

/**
 * @author NMMkhungo
 * @since 2025/09/25
 **/
@Data
public class CVAnalysisResult {
    private Double qualityScore;
    private List<String> skills;
    private Integer yearsOfExperience;
    private String educationLevel;
    private Map<String, Object> analysis;
}
