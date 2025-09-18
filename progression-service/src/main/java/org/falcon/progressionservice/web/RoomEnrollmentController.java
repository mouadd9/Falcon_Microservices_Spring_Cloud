package org.falcon.progressionservice.web;

import org.falcon.progressionservice.client.dto.RoomDTO;

import org.falcon.progressionservice.service.RoomEnrollmentService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.security.oauth2.jwt.Jwt;
import org.springframework.security.core.annotation.AuthenticationPrincipal;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api/progression/users") // resource path
public class RoomEnrollmentController {
    private final RoomEnrollmentService roomEnrollmentService;

    public RoomEnrollmentController(RoomEnrollmentService roomEnrollmentService) {
        this.roomEnrollmentService = roomEnrollmentService;
    }

    @GetMapping("/{userId}/rooms")
    public ResponseEntity<List<RoomDTO>> getRoomCatalog(@AuthenticationPrincipal Jwt jwt) {
        String userId = jwt.getSubject(); // Securely get the String userId from the token
        List<RoomDTO> rooms = roomEnrollmentService.getRoomCatalogForUser(userId);
        return new ResponseEntity<>(rooms, HttpStatus.OK);
    }

    @GetMapping("/{userId}/joined-rooms")
    public ResponseEntity<List<RoomDTO>> getJoinedRooms(@AuthenticationPrincipal Jwt jwt) {
        String userId = jwt.getSubject();
        List<RoomDTO> rooms = roomEnrollmentService.getJoinedRooms(userId);
        return new ResponseEntity<>(rooms, HttpStatus.OK);
    }

    @GetMapping("/{userId}/saved-rooms")
    public ResponseEntity<List<RoomDTO>> getSavedRooms(@AuthenticationPrincipal Jwt jwt) {
        String userId = jwt.getSubject();
        List<RoomDTO> rooms = roomEnrollmentService.getSavedRooms(userId);
        return new ResponseEntity<>(rooms, HttpStatus.OK);
    }

    @GetMapping("/{userId}/completed-rooms")
    public ResponseEntity<List<RoomDTO>> getCompletedRooms(@AuthenticationPrincipal Jwt jwt) {
        String userId = jwt.getSubject();
        List<RoomDTO> rooms = roomEnrollmentService.getCompletedRooms(userId);
        return new ResponseEntity<>(rooms, HttpStatus.OK);
    }

    @GetMapping("/{userId}/joined-rooms/{roomId}")
    public ResponseEntity<RoomDTO> getJoinedRoom(@AuthenticationPrincipal Jwt jwt, @PathVariable long roomId) {
        String userId = jwt.getSubject();
        RoomDTO room = roomEnrollmentService.getJoinedRoom(userId, roomId);
        return new ResponseEntity<>(room, HttpStatus.OK);
    }

    @PostMapping("/{userId}/rooms/{roomId}/join")
    public ResponseEntity<Void> joinRoom(@AuthenticationPrincipal Jwt jwt, @PathVariable long roomId) {
        String userId = jwt.getSubject();
        roomEnrollmentService.joinRoom(userId, roomId);
        return ResponseEntity.ok().build();
    }

    @PostMapping("/{userId}/rooms/{roomId}/save")
    public ResponseEntity<Void> saveRoom(@AuthenticationPrincipal Jwt jwt, @PathVariable long roomId) {
        String userId = jwt.getSubject();
        roomEnrollmentService.saveRoom(userId, roomId);
        return ResponseEntity.ok().build();
    }

    @PostMapping("/{userId}/rooms/{roomId}/leave")
    public ResponseEntity<Void> leaveRoom(@AuthenticationPrincipal Jwt jwt, @PathVariable long roomId) {
        String userId = jwt.getSubject();
        roomEnrollmentService.leaveRoom(userId, roomId);
        return ResponseEntity.ok().build();
    }

    @PostMapping("/{userId}/rooms/{roomId}/unsave")
    public ResponseEntity<Void> unSaveRoom(@AuthenticationPrincipal Jwt jwt, @PathVariable long roomId) {
        String userId = jwt.getSubject();
        roomEnrollmentService.unSaveRoom(userId, roomId);
        return ResponseEntity.ok().build();
    }

    @GetMapping("/{userId}/rooms/{roomId}/status")
    public ResponseEntity<Map<String, Boolean>> checkRoomStatus(@AuthenticationPrincipal Jwt jwt, @PathVariable long roomId) {
        String userId = jwt.getSubject();
        Map<String, Boolean> status = roomEnrollmentService.getRoomMembershipStatus(userId, roomId);
        return new ResponseEntity<>(status, HttpStatus.OK);
    }

    @PostMapping("/{userId}/rooms/{roomId}/reset")
    public ResponseEntity<Void> resetRoomProgress(@AuthenticationPrincipal Jwt jwt, @PathVariable Long roomId) {
        String userId = jwt.getSubject();
        roomEnrollmentService.resetRoomProgress(userId, roomId);
        return ResponseEntity.ok().build();
    }
}
