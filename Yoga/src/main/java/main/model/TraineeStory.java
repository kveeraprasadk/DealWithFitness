package main.model;

public class TraineeStory {
	private String traineeId;
	private String trainerName;
	private String storyId;
	private String story;
	private boolean adminapprove;
	private long creationTime;
	private boolean hasPhotos;

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
}
