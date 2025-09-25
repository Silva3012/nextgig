package za.co.nextgig.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.data.mongodb.repository.Query;
import org.springframework.stereotype.Repository;
import za.co.nextgig.enums.VerificationStatus;
import za.co.nextgig.model.VerificationResult;

import java.util.List;
import java.util.Optional;

/**
 * @author NMMkhungo
 * @since 2025/09/25
 **/

@Repository
public interface VerificationResultRepository extends MongoRepository<VerificationResult, String> {
    Optional<VerificationResult> findByVerificationId(String verificationId);

    List<VerificationResult> findByUserIdOrderByTimestampDesc(String userId);

    Page<VerificationResult> findAll(Pageable pageable);

    long countByStatus(VerificationStatus status);

    @Query("{ 'confidenceScore': { $gte: ?0 } }")
    List<VerificationResult> findByConfidenceScoreGreaterThanEqual(double minScore);

    @Query("{ 'timestamp': { $gte: ?0, $lte: ?1 } }")
    List<VerificationResult> findByTimestampBetween(String startDate, String endDate);

    long deleteByVerificationId(String verificationId);

    @Query(value = "{ 'userId': ?0 }", count = true)
    long countByUserId(String userId);
}
