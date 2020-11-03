package kr.or.ddit.config.type;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.core.convert.converter.Converter;

public class DateStringConverter implements Converter<String, Date> {
		
		//2020-01-01
		@Override
		public Date convert(String source) {
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			Date date = null;
			try {
				date = format.parse(source);
			} catch (ParseException e) {
				e.printStackTrace();
			}
			return date;
		}
}
