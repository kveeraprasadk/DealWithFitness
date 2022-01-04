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
	private Float fee;
	private String classLevel;
	private String trainerPreference;
	private String seriesTransitionFromId;
	private List<Schedule> schedules;
	private Set<String> attendees = new HashSet<>();
	private List<String> selectedDayNames;
	private TrainerDetailsVO trainer;
	private String expertise;
	private String ssexpertise;
	private String ssclassLevel;
	private boolean demoClass;
	private String selecteddays;
	private String monthlyfees;
	private String starttime;
	private String endtime;
	
	public String getExpertise() {
		return expertise;
	}

	public void setExpertise(String expertise) {
		this.expertise = expertise;
	}

	public boolean isDemoClass() {
		return demoClass;
	}

	public void setDemoClass(boolean demoClass) {
		this.demoClass = demoClass;
	}

	public TrainerDetailsVO getTrainer() {
		return trainer;
	}

	public void setTrainer(TrainerDetailsVO trainer) {
		this.trainer = trainer;
	}

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

	public String getSsexpertise() {
		return ssexpertise;
	}

	public void setSsexpertise(String ssexpertise) {
		this.ssexpertise = ssexpertise;
	}

	public String getSsclassLevel() {
		return ssclassLevel;
	}

	public void setSsclassLevel(String ssclassLevel) {
		this.ssclassLevel = ssclassLevel;
	}

	public String getSelecteddays() {
		return selecteddays;
	}

	public void setSelecteddays(String selecteddays) {
		this.selecteddays = selecteddays;
	}

	public String getMonthlyfees() {
		return monthlyfees;
	}

	public void setMonthlyfees(String monthlyfees) {
		this.monthlyfees = monthlyfees;
	}

	public String getStarttime() {
		return starttime;
	}

	public void setStarttime(String starttime) {
		this.starttime = starttime;
	}

	public String getEndtime() {
		return endtime;
	}

	public void setEndtime(String endtime) {
		this.endtime = endtime;
	}
}
