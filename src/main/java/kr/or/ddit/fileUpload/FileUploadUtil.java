package kr.or.ddit.fileUpload;

public class FileUploadUtil {
	
	
	// 주어진 String(Content-Disposition) : form-data; name="lang"; filename="sally.png"
	//filename의 속성은 그 위치가 바뀔 수 있음을 고려.
	//반환해야하는 값 : sally.png
	
	//FileUploadUtilTest
	
	
	
	
	public static String getFilename(String contentDisposition) {
		String[] splitArr = contentDisposition.split("; ");
		String result = "";
		
		for(String splitString : splitArr) {
			String[] resultArr = splitString.split("=");
			if("filename".equals(resultArr[0])) {
				result = resultArr[1].replaceAll("\"", "");
			}
		}
		
		return result;
	}
	//filename : sally.png ==> png
	
	public static String getExtension(String filename) {
		String extension = "";
		String[] fileStrArr = null;
		
		if(filename != null || filename.indexOf(".") != -1) {
			extension = filename.substring(filename.lastIndexOf("."));
		}
		
		return extension;
	}
	
}
