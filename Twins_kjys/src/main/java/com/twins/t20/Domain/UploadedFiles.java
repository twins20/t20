package com.twins.t20.Domain;

import java.util.Arrays;

public class UploadedFiles {

	String[] files;

	public String[] getFiles() {
		return files;
	}

	public void setFiles(String[] files) {
		this.files = files;
	}

	@Override
	public String toString() {
		return "UploadedFiles [files=" + Arrays.toString(files) + "]";
	}
}
