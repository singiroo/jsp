package kr.or.ddit.cookie;

import static org.junit.Assert.*;

import org.junit.Test;

import kr.or.ddit.cooke.CookieSplit;

public class CookieSplitTest {

	@Test
	public void getCookieValueSuccessTest() {
		/***Given***/
		CookieSplit cookieSplit = new CookieSplit();
		String[] cookieNames = {"USERNM", "REMEMBERME", "TEST", "???"};
		String[] expectedValues = {"brown", "Y", "T", ""};

		/***When***/
		for(int i=0; i<cookieNames.length; i++ ) {
			String cookieValue = cookieSplit.getCookieValue(cookieNames[i]);			
			assertEquals(expectedValues[i], cookieValue);
		}
		
		/***Then***/
		
	}
	
	@Test
	public void getCookieValueFailTest() {
		/***Given***/
		CookieSplit cookieSplit = new CookieSplit();
		String[] cookieNames = {"USERNM", "REMEMBERME", "TEST", "???"};
		String[] expectedValues = {"brown", "Y", "T", ""};
		
		/***When***/
		for(int i=0; i<cookieNames.length; i++ ) {
			String cookieValue = cookieSplit.getCookieValue(cookieNames[i]);			
			assertEquals(expectedValues[i], cookieValue);
		}
		
		/***Then***/
		
	}

}
