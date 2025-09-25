package za.co.nextgig.dto.request;

import jakarta.validation.constraints.NotNull;
import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

/**
 * @author NMMkhungo
 * @since 2025/09/25
 **/
@Data
public class VerificationRequest {
    @NotNull
    private MultipartFile idImage;

    private MultipartFile cvFile;

    private List<String> portfolioLinks;

    @NotNull
    private String userId;
}
