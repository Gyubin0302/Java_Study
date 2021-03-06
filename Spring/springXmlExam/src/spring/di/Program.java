package spring.di;

import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import spring.di.entity.Exam;
import spring.di.entity.NewlecExam;
import spring.di.ui.ExamConsole;
import spring.di.ui.GridExamConsole;
import spring.di.ui.InlineExamConsole;

public class Program {

	public static void main(String[] args) {
		
		/* 스프링에게 지시하는 방법으로 코드를 변경
		Exam exam = new NewlecExam();
		ExamConsole console = new GridExamConsole();
		
		console.setExam(exam);
		 */
		ApplicationContext context = 
		new ClassPathXmlApplicationContext("spring/di/setting.xml");
//		ExamConsole console = (ExamConsole) context.getBean("console");
		Exam exam = context.getBean(Exam.class);
		System.out.println(exam);
		ExamConsole console = context.getBean(ExamConsole.class);
		console.print();
		
		List<Exam> exams = (List<Exam>) context.getBean("exams");
		for(Exam e : exams)
			System.out.println(e);
		

	}

}
