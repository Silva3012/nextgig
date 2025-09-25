package za.co.nextgig.utils;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestClient;
import org.springframework.web.client.RestTemplate;
import za.co.nextgig.model.CVAnalysisResult;
import za.co.nextgig.model.LinkVerificationResult;
import za.co.nextgig.model.PortfolioVerificationResult;

import java.io.IOException;
import java.util.*;
import java.util.concurrent.CompletableFuture;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/**
 * @author NMMkhungo
 * @since 2025/09/25
 **/
@Slf4j
@Component
public class DocumentAnalysisUtil {

    private final RestTemplate restTemplate;
    private final ExecutorService executorService;

    // Constructor injection
    public DocumentAnalysisUtil(RestTemplate restTemplate) {
        this.restTemplate = restTemplate;
        this.executorService = Executors.newFixedThreadPool(5); // Configurable thread pool
    }

    // Example: Using RestClient for GET requests
//    public String fetchExternalData(String url) {
//        try {
//            return restTemplate
//                    .get()
//                    .uri(url)
//                    .retrieve()
//                    .body(String.class);
//        } catch (Exception e) {
//            log.error("Failed to fetch data from {}", url, e);
//            return null;
//        }
//    }

    public String fetchExternalData(String url) {
        try {
            // RestTemplate uses getForObject for GET requests
            return restTemplate.getForObject(url, String.class);
        } catch (Exception e) {
            log.error("Failed to fetch data from {}", url, e);
            return null;
        }
    }


    public CVAnalysisResult analyzeCV(byte[] cvData) {
        try {
            String text = extractTextFromPDF(cvData);
            return analyzeCVText(text);
        } catch (Exception e) {
            log.error("Error analyzing CV", e);
            CVAnalysisResult result = new CVAnalysisResult();
            result.setQualityScore(0.0);
            result.setSkills(new ArrayList<>());
            result.setYearsOfExperience(0);
            return result;
        }
    }

    private String extractTextFromPDF(byte[] pdfData) throws IOException {
        /* TO-DO */
//        try (PDDocument document = PDDocument.load(new ByteArrayInputStream(pdfData))) {
//            PDFTextStripper stripper = new PDFTextStripper();
//            return stripper.getText(document);
//        }
            return null;
        }

    private CVAnalysisResult analyzeCVText(String text) {
        CVAnalysisResult result = new CVAnalysisResult();

        // Basic analysis (in production, integrate with AI service)
        List<String> skills = extractSkills(text);
        int experience = estimateExperience(text);
        double qualityScore = calculateQualityScore(text, skills.size(), experience);

        result.setSkills(skills);
        result.setYearsOfExperience(experience);
        result.setQualityScore(qualityScore);
        result.setEducationLevel(extractEducationLevel(text));

        Map<String, Object> analysis = new HashMap<>();
        analysis.put("wordCount", text.split("\\s+").length);
        analysis.put("sections", detectSections(text));
        result.setAnalysis(analysis);

        return result;
    }

    private List<String> extractSkills(String text) {
        // Simplified skill extraction
        List<String> commonSkills = Arrays.asList("Java", "Spring", "Python", "JavaScript", "SQL", "AWS", "Docker", "Kubernetes");
        List<String> foundSkills = new ArrayList<>();

        for (String skill : commonSkills) {
            if (text.toLowerCase().contains(skill.toLowerCase())) {
                foundSkills.add(skill);
            }
        }
        return foundSkills;
    }

    private int estimateExperience(String text) {
        // Basic experience estimation
        if (text.toLowerCase().contains("10+ years") || text.toLowerCase().contains("senior")) return 10;
        if (text.toLowerCase().contains("5 years")) return 5;
        if (text.toLowerCase().contains("2 years")) return 2;
        return 1;
    }

    private double calculateQualityScore(String text, int skillsCount, int experience) {
        double score = 0.0;
        score += Math.min(skillsCount / 10.0, 0.4); // 40% for skills
        score += Math.min(experience / 20.0, 0.3);  // 30% for experience
        score += Math.min(text.length() / 5000.0, 0.3); // 30% for content
        return Math.min(score, 1.0);
    }

    private String extractEducationLevel(String text) {
        if (text.toLowerCase().contains("phd") || text.toLowerCase().contains("doctorate")) return "PhD";
        if (text.toLowerCase().contains("master")) return "Masters";
        if (text.toLowerCase().contains("bachelor") || text.toLowerCase().contains("degree")) return "Bachelors";
        return "Other";
    }

    private List<String> detectSections(String text) {
        List<String> sections = new ArrayList<>();
        if (text.toLowerCase().contains("experience")) sections.add("Experience");
        if (text.toLowerCase().contains("education")) sections.add("Education");
        if (text.toLowerCase().contains("skills")) sections.add("Skills");
        return sections;
    }

    /**
     * Verify portfolio links asynchronously
     */
    public CompletableFuture<PortfolioVerificationResult> verifyPortfolioLinks(List<String> portfolioLinks) {
        return CompletableFuture.supplyAsync(() -> {
            PortfolioVerificationResult result = new PortfolioVerificationResult();
            Map<String, LinkVerificationResult> linkResults = new HashMap<>();

            log.info("🔗 Starting verification of {} portfolio links", portfolioLinks.size());

            // Process links in parallel
            List<CompletableFuture<Void>> futures = portfolioLinks.stream()
                    .map(link -> CompletableFuture.runAsync(() -> {
                        linkResults.put(link, verifySingleLink(link));
                    }, executorService))
                    .toList();

            // Wait for all verifications to complete
            CompletableFuture.allOf(futures.toArray(new CompletableFuture[0])).join();

            result.setLinks(linkResults);

            // Calculate summary statistics
            calculateSummaryStatistics(result);

            log.info("Portfolio link verification completed. Accessible: {}/{}",
                    result.getAccessibleLinksCount(), portfolioLinks.size());

            return result;
        }, executorService);
    }

    private LinkVerificationResult verifySingleLink(String link) {
        LinkVerificationResult result = new LinkVerificationResult();
        long startTime = System.currentTimeMillis();

        log.debug("Verifying link: {}", link);

        if (!isValidUrl(link)) {
            result.setAccessible(false);
            result.setError("Invalid URL format");
            result.setLoadTime(0.0);
            return result;
        }

        try {
            // Use GET with minimal data for demo
            var response = restTemplate.getForEntity(link, String.class);

            result.setAccessible(true);
            result.setStatusCode(response.getStatusCodeValue());
            result.setContentType(response.getHeaders().getContentType() != null ?
                    response.getHeaders().getContentType().toString() : "Unknown");
            result.setLoadTime((System.currentTimeMillis() - startTime) / 1000.0);

            log.debug("Link accessible: {} (Status: {})", link, result.getStatusCode());
        } catch (Exception e) {
            result.setAccessible(false);
            result.setError(e.getMessage());
            result.setLoadTime((System.currentTimeMillis() - startTime) / 1000.0);
            log.debug("Link verification failed: {} ({})", link, e.getMessage());
        }

        return result;
    }


    /**
     * Fallback to GET request when HEAD is not supported
     */
    private void tryGetRequest(String link, LinkVerificationResult result, long startTime) {
        try {
            HttpHeaders headers = new HttpHeaders();
            headers.set("User-Agent", getRandomUserAgent());
            HttpEntity<String> entity = new HttpEntity<>(headers);

            ResponseEntity<String> response = restTemplate.exchange(
                    link,
                    HttpMethod.GET,
                    entity,
                    String.class
            );

            result.setAccessible(true);
            result.setStatusCode(response.getStatusCodeValue());
            result.setContentType(response.getHeaders().getContentType() != null ?
                    response.getHeaders().getContentType().toString() : "Unknown");
            result.setLoadTime((System.currentTimeMillis() - startTime) / 1000.0);

            log.debug("GET successful for: {} (Status: {})", link, result.getStatusCode());
        } catch (Exception getException) {
            result.setAccessible(false);
            result.setError(getException.getMessage());
            result.setLoadTime((System.currentTimeMillis() - startTime) / 1000.0);
            log.warn("GET failed for {}: {}", link, getException.getMessage());
        }
    }


    /**
     * Handle verification errors gracefully
     */
    private void handleVerificationError(String link, LinkVerificationResult result,
                                         Exception e, long startTime) {
        result.setAccessible(false);
        result.setError(e.getMessage());
        result.setLoadTime((System.currentTimeMillis() - startTime) / 1000.0);

        // Categorize error types
        if (e.getMessage().contains("Connection refused") || e.getMessage().contains("Connect timeout")) {
            result.setError("Connection failed - site may be down");
        } else if (e.getMessage().contains("SSL") || e.getMessage().contains("certificate")) {
            result.setError("SSL certificate error");
        } else if (e.getMessage().contains("404") || e.getMessage().contains("Not Found")) {
            result.setError("Page not found (404)");
        } else if (e.getMessage().contains("403") || e.getMessage().contains("Forbidden")) {
            result.setError("Access forbidden (403)");
        }

        log.warn("⚠Link verification failed for {}: {}", link, e.getMessage());
    }

    /**
     * Validate URL format
     */
    private boolean isValidUrl(String url) {
        try {
            new java.net.URL(url);
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    /**
     * Get random user agent to avoid blocking
     */
    private String getRandomUserAgent() {
        String[] userAgents = {
                "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36",
                "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.1.1 Safari/605.1.15",
                "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.107 Safari/537.36",
                "Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:90.0) Gecko/20100101 Firefox/90.0",
                "Mozilla/5.0 (iPhone; CPU iPhone OS 14_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.0 Mobile/15E148 Safari/604.1"
        };
        return userAgents[(int) (Math.random() * userAgents.length)];
    }

    /**
     * Calculate summary statistics for the verification result
     */
    private void calculateSummaryStatistics(PortfolioVerificationResult result) {
        if (result.getLinks() == null) return;

        long accessibleCount = result.getLinks().values().stream()
                .filter(linkResult -> linkResult.getAccessible() != null && linkResult.getAccessible())
                .count();

        long totalCount = result.getLinks().size();
        double successRate = totalCount > 0 ? (accessibleCount * 100.0) / totalCount : 0.0;

        // Calculate average load time for accessible links
        double avgLoadTime = result.getLinks().values().stream()
                .filter(linkResult -> linkResult.getAccessible() != null && linkResult.getAccessible())
                .filter(linkResult -> linkResult.getLoadTime() != null)
                .mapToDouble(LinkVerificationResult::getLoadTime)
                .average()
                .orElse(0.0);

        result.setAccessibleLinksCount((int) accessibleCount);
        result.setTotalLinksCount((int) totalCount);
        result.setSuccessRate(successRate);
        result.setAverageLoadTime(avgLoadTime);
    }

    /**
     * Enhanced version with content type validation
     */
    public CompletableFuture<PortfolioVerificationResult> verifyPortfolioLinksWithContentCheck(
            List<String> portfolioLinks, List<String> allowedContentTypes) {

        return verifyPortfolioLinks(portfolioLinks).thenApply(result -> {
            if (result.getLinks() != null && allowedContentTypes != null) {
                result.getLinks().forEach((link, linkResult) -> {
                    if (linkResult.getAccessible() != null && linkResult.getAccessible()) {
                        boolean validContentType = allowedContentTypes.stream()
                                .anyMatch(allowedType ->
                                        linkResult.getContentType() != null &&
                                                linkResult.getContentType().toLowerCase().contains(allowedType.toLowerCase()));

                        linkResult.setContentTypeValid(validContentType);

                        if (!validContentType) {
                            log.debug("⚠️ Content type not allowed for {}: {}", link, linkResult.getContentType());
                        }
                    }
                });
            }
            return result;
        });
    }

    /**
     * Shutdown executor service gracefully
     */
    public void shutdown() {
        if (executorService != null && !executorService.isShutdown()) {
            executorService.shutdown();
            log.info("Executor service shut down");
        }
    }
}
