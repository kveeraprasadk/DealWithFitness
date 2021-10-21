package main.model;

import java.sql.Timestamp;

public class TraineeStory {
	private String traineeId;
	private String trainerName;
	private String storyId;
	private String story;
	private boolean adminapprove;
	private long creationTime;
	private boolean hasPhotos;
	private String trainerId;
	private String filename1;
	private String filename2;
	private Timestamp createtime;

	public boolean isHasPhotos() {
		return hasPhotos;
	}

	public void setHasPhotos(boolean hasPhotos) {
		this.hasPhotos = hasPhotos;
	}

	public String getTrainerName() {
		return trainerName;
	}

	public void setTrainerName(String trainerName) {
		this.trainerName = trainerName;
	}

	public long getCreationTime() {
		return creationTime;
	}

	public void setCreationTime(long creationTime) {
		this.creationTime = creationTime;
	}

	public String getTraineeId() {
		return traineeId;
	}

	public void setTraineeId(String traineeId) {
		this.traineeId = traineeId;
	}

	public String getStoryId() {
		return storyId;
	}

	public void setStoryId(String storyId) {
		this.storyId = storyId;
	}

	public String getStory() {
		return story;
	}

	public void setStory(String story) {
		this.story = story;
	}

	public boolean isAdminapprove() {
		return adminapprove;
	}

	public void setAdminapprove(boolean adminapprove) {
		this.adminapprove = adminapprove;
	}

	public String getTrainerId() {
		return trainerId;
	}

	public void setTrainerId(String trainerId) {
		this.trainerId = trainerId;
	}

	public String getFilename1() {
		return filename1;
	}

	public void setFilename1(String filename1) {
		this.filename1 = filename1;
	}

	public String getFilename2() {
		return filename2;
	}



	public void setFilename2(String filename2) {
		this.filename2 = filename2;
	}

	public Timestamp getCreatetime() {
		return createtime;
	}

	public void setCreatetime(Timestamp createtime) {
		this.createtime = createtime;
	}
}
