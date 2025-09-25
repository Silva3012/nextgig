package za.co.nextgig.dto.reponse;

import lombok.Data;

import java.util.List;

/**
 * @author NMMkhungo
 * @since 2025/09/25
 **/
@Data
public class IDVerificationResponse {
    private String idNumber;
    private Boolean validFormat;
    private Boolean checksumValid;
    private String birthDate;
    private String citizenship;
    private List<String> extractedNames;
}
