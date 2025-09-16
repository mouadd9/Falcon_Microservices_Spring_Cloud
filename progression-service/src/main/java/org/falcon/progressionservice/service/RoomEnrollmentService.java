package org.falcon.progressionservice.service;

import org.falcon.progressionservice.client.dto.RoomDTO;

import java.util.List;
import java.util.Map;

public interface RoomEnrollmentService {
    // operations on rooms
    void joinRoom(String userId, Long roomId); // if the room is already saved we will set joinedAt to the existing room membership
    void saveRoom(String userId, Long roomId); // if the room is already joined we will set isSaved to true and not create the membership.
    void unSaveRoom(String userId, Long roomId); // if the room is already joined we will set isSaved to false and not create the membership.
    void leaveRoom(String userId, Long roomId); // if the room is already joined we will set leftAt to the existing room membership
    void resetRoomProgress(String userId, Long roomId);
    // room retrievals
    List<RoomDTO> getRoomCatalogForUser(String userId);
    List<RoomDTO> getJoinedRooms(String userId); // we use the memberships
    List<RoomDTO> getSavedRooms(String userId); // we use the memberships
    List<RoomDTO> getCompletedRooms(String userId); // this requires knowing if a room is completed or not
    RoomDTO getJoinedRoom(String userId, Long roomId); // we use the memberships
    // status retrieval
    Map<String, Boolean> getRoomMembershipStatus(String userId, Long roomId);
}

