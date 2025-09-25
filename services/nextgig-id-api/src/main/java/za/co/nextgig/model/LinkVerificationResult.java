package za.co.nextgig.model;

import lombok.Data;

/**
 * @author NMMkhungo
 * @since 2025/09/25
 **/

@Data
public class LinkVerificationResult {
    private Boolean accessible;
    private Integer statusCode;
    private String contentType;
    private Boolean contentTypeValid; // Added for content validation
    private Double loadTime;
    private String error;
    private Long timestamp;

    public LinkVerificationResult() {
        this.timestamp = System.currentTimeMillis();
    }
}
