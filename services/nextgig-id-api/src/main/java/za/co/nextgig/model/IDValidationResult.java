package za.co.nextgig.model;

import lombok.Data;

/**
 * @author NMMkhungo
 * @since 2025/09/25
 **/
@Data
public class IDValidationResult {
    private Boolean valid;
    private String reason;
    private String birthDate;
    private Boolean birthDateValid;
    private String citizenship;
    private Boolean checksumValid;
}
