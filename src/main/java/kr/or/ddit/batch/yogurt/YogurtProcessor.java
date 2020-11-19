package kr.or.ddit.batch.yogurt;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.batch.item.ItemProcessor;
import org.springframework.beans.factory.annotation.Value;

import kr.or.ddit.yogurt.model.CycleVO;
import kr.or.ddit.yogurt.model.DailyVO;

public class YogurtProcessor implements ItemProcessor<CycleVO, List<DailyVO>> {
	
	private static final Logger logger = LoggerFactory.getLogger(YogurtProcessor.class);
	
	//jobLauncher를 실행하면서 두번째 인자로 넣어준 jobParameter 갑을 SPEl을 통해 주입
	//단, jobParameters에 접근하기 위해서는 해당 스프링 빈의 scope를 step으로 지정해야한다.
	//문자열, 스프링 빈이 아님
	
	
	@Value("#{jobParameters[ym]}")
	private String ym;
	
	private SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
	
	
	@Override
	public List<DailyVO> process(CycleVO item) throws Exception {
		// 생성 월이 202011월
		//	cid = 1, pid = 100, day = 2, cnt = 3
		//	==>
		//  cid = 1, pid=100, dt=20201102, cnt = 3
		//  cid = 1, pid=100, dt=20201109, cnt = 3
		//  cid = 1, pid=100, dt=20201116, cnt = 3
		//  cid = 1, pid=100, dt=20201123, cnt = 3
		//  cid = 1, pid=100, dt=20201130, cnt = 3
		logger.debug("ym : {}, item : {}", ym, item);
		List<DailyVO> dailyVoList = new ArrayList<DailyVO>();
		
		Calendar calendar = Calendar.getInstance();		//현재 시간.
		//calendar의 날짜를 20201130으로 셋팅
		calendar.set(Calendar.YEAR, Integer.parseInt(ym.substring(0, 4)));  // 년도 잘라오기
		calendar.set(Calendar.MONTH, Integer.parseInt(ym.substring(4))-1);  // 월 잘라오기
		calendar.set(Calendar.DAY_OF_MONTH, calendar.getActualMaximum(Calendar.DAY_OF_MONTH));  //3
		
		//calendar 2020 11 30
		Date endTime = calendar.getTime();
		String endTimeStr = sdf.format(endTime);
		int endTimeInt = Integer.parseInt(endTimeStr);
		
		//해당 월의 1일로 설정
		//20201101
		calendar.set(Calendar.DAY_OF_MONTH, 1);
		Date dt = calendar.getTime();
		String dtStr = sdf.format(dt);
		int dtInt = Integer.parseInt(dtStr);
		//calendar 2020 11 01
		
		// endTime > calendar.getTime()
		
		while(endTime.compareTo(calendar.getTime()) >= 0) {
			
			//calendar 날짜가 item의 애음요일과 같을 때만 dailyVo를 생성
			if(item.getDay() == calendar.get(Calendar.DAY_OF_WEEK)) {
				DailyVO dailyVo = new DailyVO();
				dailyVo.setCid(item.getCid());
				dailyVo.setPid(item.getPid());
				dailyVo.setDt(new SimpleDateFormat("yyyyMMdd").format(calendar.getTime()));
				dailyVo.setCnt(item.getCnt());
				
				dailyVoList.add(dailyVo);
				
			}
			
			// 날짜 증가
			calendar.set(Calendar.DAY_OF_MONTH, calendar.get(Calendar.DAY_OF_MONTH) + 1);
			dt = calendar.getTime();
			dtStr = sdf.format(dt);
			dtInt = Integer.parseInt(dtStr);
		}
		
		return dailyVoList;
	}

}
