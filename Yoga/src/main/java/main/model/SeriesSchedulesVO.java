package main.model;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

public class SeriesSchedulesVO {
	private String id;
	private String traineremail;
	private String title;
	private String location;
	private long startTime;
	private long endTime;
	private Long endByDate;
	private List<String> selectedDayNames;
	private Float fee;
	private String classLevel;
	private String trainerPreference;
	private String seriesTransitionFromId;
	private List<Schedule> schedules;
	private Set<String> attendees = new HashSet<>();

	public String getTraineremail() {
		return traineremail;
	}

	public void setTraineremail(String traineremail) {
		this.traineremail = traineremail;
	}

	public Set<String> getAttendees() {
		return attendees;
	}

	public void setAttendees(Set<String> attendees) {
		this.attendees = attendees;
	}

	public String getTrainerPreference() {
		return trainerPreference;
	}

	public void setTrainerPreference(String trainerPreference) {
		this.trainerPreference = trainerPreference;
	}

	public Float getFee() {
		return fee;
	}

	public void setFee(Float fee) {
		this.fee = fee;
	}

	public String getClassLevel() {
		return classLevel;
	}

	public void setClassLevel(String classLevel) {
		this.classLevel = classLevel;
	}

	public String getSeriesTransitionFromId() {
		return seriesTransitionFromId;
	}

	public void setSeriesTransitionFromId(String seriesTransitionFromId) {
		this.seriesTransitionFromId = seriesTransitionFromId;
	}

	public void setSchedules(List<Schedule> sehedules) {
		this.schedules = sehedules;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public List<String> getSelectedDayNames() {
		return selectedDayNames;
	}

	public void setSelectedDayNames(List<String> selectedDayNames) {
		this.selectedDayNames = selectedDayNames;
	}

	public List<Schedule> getSchedules() {
		return schedules;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public long getStartTime() {
		return startTime;
	}

	public void setStartTime(long startTime) {
		this.startTime = startTime;
	}

	public long getEndTime() {
		return endTime;
	}

	public void setEndTime(long endTime) {
		this.endTime = endTime;
	}

	public Long getEndByDate() {
		return endByDate;
	}

	public void setEndByDate(Long endByDate) {
		this.endByDate = endByDate;
	}

	@JsonIgnoreProperties(ignoreUnknown = true)
	public static class Schedule {
		private String id;
		private String seriesId;
		private String title;
		private String location;
		private long start;
		private long end;

		public String getTitle() {
			return title;
		}

		public void setTitle(String title) {
			this.title = title;
		}

		public String getLocation() {
			return location;
		}

		public void setLocation(String location) {
			this.location = location;
		}

		public String getId() {
			return id;
		}

		public void setId(String id) {
			this.id = id;
		}

		public String getSeriesId() {
			return seriesId;
		}

		public void setSeriesId(String seriesId) {
			this.seriesId = seriesId;
		}

		public long getStart() {
			return start;
		}

		public void setStart(long start) {
			this.start = start;
		}

		public long getEnd() {
			return end;
		}

		public void setEnd(long end) {
			this.end = end;
		}
	}
}
