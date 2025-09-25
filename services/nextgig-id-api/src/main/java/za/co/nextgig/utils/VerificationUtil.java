package za.co.nextgig.utils;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import za.co.nextgig.model.VerificationResult;
import za.co.nextgig.enums.VerificationStatus;

import java.time.LocalDateTime;
import java.util.concurrent.CompletableFuture;

/**
 * @author NMMkhungo
 * @since 2025/09/25
 **/

@Slf4j
@Component
public class VerificationUtil {
    private final SAIDVerificationUtil idVerificationUtil;
    private final DocumentAnalysisUtil documentAnalysisUtil;
    private final VerificationResultUtil resultService;

    @Autowired
    public VerificationUtil(SAIDVerificationUtil idVerificationUtil,
                            DocumentAnalysisUtil documentAnalysisUtil,
                               VerificationResultUtil resultService) {
        this.idVerificationUtil = idVerificationUtil;
        this.documentAnalysisUtil = documentAnalysisUtil;
        this.resultService = resultService;
    }

    @Async
    public CompletableFuture<VerificationResult> processVerification(
            MultipartFile idImage,
            MultipartFile cvFile,
            java.util.List<String> portfolioLinks,
            String userId) {

        VerificationResult result = new VerificationResult();
        result.setUserId(userId);
        result.setTimestamp(LocalDateTime.now());
        result.setStatus(VerificationStatus.PENDING);

        try {
            // Process ID verification
            byte[] idImageData = idImage.getBytes();
            result.setIdVerification(idVerificationUtil.verifyID(idImageData));

            // Process CV analysis if provided
            if (cvFile != null && !cvFile.isEmpty()) {
                byte[] cvData = cvFile.getBytes();
                result.setCvAnalysis(documentAnalysisUtil.analyzeCV(cvData));
            }

            // Process portfolio links if provided
            if (portfolioLinks != null && !portfolioLinks.isEmpty()) {
                var portfolioFuture = documentAnalysisUtil.verifyPortfolioLinks(portfolioLinks);
                result.setPortfolioVerification(portfolioFuture.get());
            }

            // Calculate confidence score
            result.setConfidenceScore(calculateConfidenceScore(result));
            result.setStatus(VerificationStatus.COMPLETED);

        } catch (Exception e) {
            log.error("Verification processing failed", e);
            result.setStatus(VerificationStatus.FAILED);
        }

        // Save result
        return CompletableFuture.completedFuture(resultService.saveResult(result));
    }

    private Double calculateConfidenceScore(VerificationResult result) {
        double score = 0.0;

        // ID verification weight: 60%
        if (result.getIdVerification() != null &&
                result.getIdVerification().getIsVerified() != null &&
                result.getIdVerification().getIsVerified()) {
            score += 0.6;
        }

        // CV analysis weight: 25%
        if (result.getCvAnalysis() != null && result.getCvAnalysis().getQualityScore() != null) {
            score += 0.25 * result.getCvAnalysis().getQualityScore();
        }

        // Portfolio weight: 15%
        if (result.getPortfolioVerification() != null &&
                result.getPortfolioVerification().getLinks() != null) {
            long accessibleLinks = result.getPortfolioVerification().getLinks().values().stream()
                    .filter(link -> link.getAccessible() != null && link.getAccessible())
                    .count();
            int totalLinks = result.getPortfolioVerification().getLinks().size();

            if (totalLinks > 0) {
                score += 0.15 * (accessibleLinks / (double) totalLinks);
            }
        }

        return Math.min(score, 1.0);
    }
}
