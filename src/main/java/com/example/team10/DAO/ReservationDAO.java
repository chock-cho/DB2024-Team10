package main.java.com.example.team10.DAO;

import java.util.List;

import main.java.com.example.team10.DTO.ReservationDTO;

public interface ReservationDAO {

	List<ReservationDTO> getReservationsByUserId(long id);
  
	public void createReservation(ReservationDTO reservation);
	
	public void insertReservation(ReservationDTO reservation);

}