package org.falcon.progressionservice.service;

public interface FlagSubmissionService {
    boolean processSubmission(String userId, Long challengeId, String submittedFlag);
    void deleteSubmissionsForUserAndRoom(String userId, Long roomId);
}
