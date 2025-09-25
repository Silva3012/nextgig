package za.co.nextgig.utils;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.aggregation.Aggregation;
import org.springframework.data.mongodb.core.aggregation.AggregationResults;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.core.query.Update;
import org.springframework.stereotype.Component;
import za.co.nextgig.dto.VerificationStatistics;
import za.co.nextgig.enums.VerificationStatus;
import za.co.nextgig.model.VerificationResult;
import za.co.nextgig.repository.VerificationResultRepository;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;
import java.util.Optional;

/**
 * @author NMMkhungo
 * @since 2025/09/25
 **/
@Slf4j
@Component
public class VerificationResultUtil {
    private final VerificationResultRepository verificationResultRepository;
    private final MongoTemplate mongoTemplate;

    @Autowired
    public VerificationResultUtil(VerificationResultRepository verificationResultRepository,
                                     MongoTemplate mongoTemplate) {
        this.verificationResultRepository = verificationResultRepository;
        this.mongoTemplate = mongoTemplate;
    }

    /**
     * Save verification result
     */
    public VerificationResult saveResult(VerificationResult result) {
        try {
            // Generate verification ID if not present
            if (result.getVerificationId() == null) {
                result.setVerificationId(generateVerificationId());
            }

            // Set timestamp if not present
            if (result.getTimestamp() == null) {
                result.setTimestamp(LocalDateTime.now());
            }

            VerificationResult savedResult = verificationResultRepository.save(result);
            log.info("Verification result saved with ID: {}", savedResult.getVerificationId());
            return savedResult;

        } catch (Exception e) {
            log.error("Failed to save verification result", e);
            throw new RuntimeException("Failed to save verification result", e);
        }
    }

    /**
     * Find by verification ID
     */
    public VerificationResult getResult(String verificationId) {
        try {
            Optional<VerificationResult> result = verificationResultRepository.findByVerificationId(verificationId);
            if (result.isPresent()) {
                log.debug("Retrieved verification result: {}", verificationId);
                return result.get();
            } else {
                log.warn("Verification result not found: {}", verificationId);
                return null;
            }
        } catch (Exception e) {
            log.error("Error retrieving verification result: {}", verificationId, e);
            throw new RuntimeException("Error retrieving verification result", e);
        }
    }

    /**
     * Find by user ID
     */
    public List<VerificationResult> getResultsByUserId(String userId) {
        try {
            List<VerificationResult> results = verificationResultRepository.findByUserIdOrderByTimestampDesc(userId);
            log.debug("Retrieved {} verification results for user: {}", results.size(), userId);
            return results;
        } catch (Exception e) {
            log.error("Error retrieving results for user: {}", userId, e);
            throw new RuntimeException("Error retrieving user verification results", e);
        }
    }

    /**
     * Get all results with pagination
     */
    public Page<VerificationResult> getAllResults(Pageable pageable) {
        try {
            Page<VerificationResult> results = verificationResultRepository.findAll(pageable);
            log.debug("📊 Retrieved page {} of verification results", pageable.getPageNumber());
            return results;
        } catch (Exception e) {
            log.error("Error retrieving paginated results", e);
            throw new RuntimeException("Error retrieving paginated results", e);
        }
    }

    /**
     * Update verification status
     */
    public VerificationResult updateStatus(String verificationId, VerificationStatus status) {
        try {
            Query query = new Query(Criteria.where("verificationId").is(verificationId));
            Update update = new Update()
                    .set("status", status)
                    .set("timestamp", LocalDateTime.now());

            VerificationResult updated = mongoTemplate.findAndModify(query, update, VerificationResult.class);

            if (updated != null) {
                log.info("🔄 Updated status for verification {} to {}", verificationId, status);
            } else {
                log.warn("⚠️ Verification not found for status update: {}", verificationId);
            }

            return updated;
        } catch (Exception e) {
            log.error("Error updating status for verification: {}", verificationId, e);
            throw new RuntimeException("Error updating verification status", e);
        }
    }

    /**
     * Update confidence score
     */
    public VerificationResult updateConfidenceScore(String verificationId, Double confidenceScore) {
        try {
            Query query = new Query(Criteria.where("verificationId").is(verificationId));
            Update update = new Update()
                    .set("confidenceScore", confidenceScore)
                    .set("timestamp", LocalDateTime.now());

            VerificationResult updated = mongoTemplate.findAndModify(query, update, VerificationResult.class);

            if (updated != null) {
                log.debug("📈 Updated confidence score for {} to {}", verificationId, confidenceScore);
            }

            return updated;
        } catch (Exception e) {
            log.error("Error updating confidence score for verification: {}", verificationId, e);
            throw new RuntimeException("Error updating confidence score", e);
        }
    }

    /**
     * Search results by criteria
     */
    public List<VerificationResult> searchResults(String userId, VerificationStatus status,
                                                  Double minConfidence, LocalDateTime startDate,
                                                  LocalDateTime endDate) {
        try {
            Criteria criteria = new Criteria();

            if (userId != null) {
                criteria.and("userId").is(userId);
            }
            if (status != null) {
                criteria.and("status").is(status);
            }
            if (minConfidence != null) {
                criteria.and("confidenceScore").gte(minConfidence);
            }
            if (startDate != null && endDate != null) {
                criteria.and("timestamp").gte(startDate).lte(endDate);
            }

            Query query = new Query(criteria).with(org.springframework.data.domain.Sort.by("timestamp").descending());

            List<VerificationResult> results = mongoTemplate.find(query, VerificationResult.class);
            log.debug("Found {} verification results matching criteria", results.size());

            return results;
        } catch (Exception e) {
            log.error("Error searching verification results", e);
            throw new RuntimeException("Error searching verification results", e);
        }
    }

    /**
     * Get statistics
     */
    public VerificationStatistics getStatistics() {
        try {
            VerificationStatistics stats = new VerificationStatistics();

            // Total count
            stats.setTotalVerifications(verificationResultRepository.count());

            // Count by status
            stats.setCompletedCount(verificationResultRepository.countByStatus(VerificationStatus.COMPLETED));
            stats.setPendingCount(verificationResultRepository.countByStatus(VerificationStatus.PENDING));
            stats.setFailedCount(verificationResultRepository.countByStatus(VerificationStatus.FAILED));

            // Average confidence score - CORRECTED
            Double avgConfidence = calculateAverageConfidenceScore();
            stats.setAverageConfidenceScore(avgConfidence);

            log.debug("Retrieved verification statistics");
            return stats;

        } catch (Exception e) {
            log.error("Error retrieving statistics", e);
            throw new RuntimeException("Error retrieving verification statistics", e);
        }
    }

    private Double calculateAverageConfidenceScore() {
        try {
            // Method 1: Using Aggregation Framework (Recommended)
            Aggregation aggregation = Aggregation.newAggregation(
                    Aggregation.match(Criteria.where("confidenceScore").ne(null)),
                    Aggregation.group().avg("confidenceScore").as("averageScore")
            );

            AggregationResults<Map> results = mongoTemplate.aggregate(
                    aggregation, "verifications", Map.class);

            if (results.getMappedResults().isEmpty()) {
                return 0.0;
            }

            Map<String, Object> resultMap = results.getMappedResults().get(0);
            return resultMap.get("averageScore") != null ?
                    ((Number) resultMap.get("averageScore")).doubleValue() : 0.0;

        } catch (Exception e) {
            log.warn("⚠️ Error calculating average confidence score, using fallback method", e);
            return calculateAverageFallback();
        }
    }

    /**
     * Fallback method using repository
     */
    private Double calculateAverageFallback() {
        try {
            List<VerificationResult> results = verificationResultRepository.findAll();
            return results.stream()
                    .filter(result -> result.getConfidenceScore() != null)
                    .mapToDouble(VerificationResult::getConfidenceScore)
                    .average()
                    .orElse(0.0);
        } catch (Exception e) {
            log.error("Fallback average calculation failed", e);
            return 0.0;
        }
    }

    /**
     * Delete verification result
     */
    public boolean deleteResult(String verificationId) {
        try {
            long deletedCount = verificationResultRepository.deleteByVerificationId(verificationId);
            boolean success = deletedCount > 0;

            if (success) {
                log.info("🗑Deleted verification result: {}", verificationId);
            } else {
                log.warn("Verification result not found for deletion: {}", verificationId);
            }

            return success;
        } catch (Exception e) {
            log.error("Error deleting verification result: {}", verificationId, e);
            throw new RuntimeException("Error deleting verification result", e);
        }
    }

    /**
     * Generate unique verification ID
     */
    private String generateVerificationId() {
        return "VER_" + System.currentTimeMillis() + "_" +
                java.util.UUID.randomUUID().toString().substring(0, 8).toUpperCase();
    }
}
