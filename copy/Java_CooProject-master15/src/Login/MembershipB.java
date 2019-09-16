package Login;

import java.awt.Container;
import java.awt.GridLayout;
import java.awt.Label;

import javax.swing.JButton;
import javax.swing.JComboBox;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JPasswordField;
import javax.swing.JTextField;
import javax.swing.text.GapContent;

public class MembershipB extends JFrame {
	JPasswordField pwT;
	JTextField nameT, idT, tel2T, tel3T, emailT, emailadductionT;
	private JLabel nameL, idL, pwL, phoneL, ageL, ageYearL, ageMonthL, ageDayL, emailL, emailadductionL, emailcomL;;
	JButton joinB, calneB, emeilokB, idoverlapB, emailB;;
	JComboBox<String> telC, emailC, ageYearC, ageMonthC, ageDayC;

	public MembershipB() {
		setTitle("ȸ������");
		String[] tel = { "010", "02", "031", "032", "033", "041", "042", "043", "044", "051", "052", "053", "054",
				"055", "061", "062", "063", "064" };
		String[] email = { "naver.com", "gmail.com" };
		String[] ageYear = { "1980", "1981", "1982", "1983", "1984", "1985", "1986", "1987", "1988", "1989", "1990",
				"1991", "1992", "1993", "1994", "1995", "1996", "1997", "1998", "1999", "2000", "2001", "2002", "2003",
				"2004", "2005", "2006", "2007", "2008", "2009", "2010", "2011", "2012", "2013", "2014", "2015", "2016",
				"2017", "2018", "2019" };
		String[] ageMonth = { "01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12" };
		String[] ageDay = { "01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15",
				"16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31" };

		telC = new JComboBox<String>(tel);
		emailC = new JComboBox<String>(email);
		ageYearC = new JComboBox<String>(ageYear);
		ageMonthC = new JComboBox<String>(ageMonth);
		ageDayC = new JComboBox<String>(ageDay);

		nameL = new JLabel("�̸�");
		nameT = new JTextField(15);
		JPanel p1 = new JPanel();
		p1.add(nameL);
		p1.add(nameT);

		idL = new JLabel("���̵�");
		idT = new JTextField(15);
		idoverlapB = new JButton("�ߺ�Ȯ��");
		JPanel p2 = new JPanel();
		p2.add(idL);
		p2.add(idT);
		p2.add(idoverlapB);

		pwL = new JLabel("��й�ȣ");
		pwT = new JPasswordField(15);
		pwT.setEchoChar('*');
		JPanel p3 = new JPanel();
		p3.add(pwL);
		p3.add(pwT);

		ageL = new JLabel("�������");
		ageYearL = new JLabel("�⵵");
		ageMonthL = new JLabel("��");
		ageDayL = new JLabel("��");
		JPanel p4 = new JPanel();
		p4.add(ageL);
		p4.add(ageYearC);
		p4.add(ageYearL);
		p4.add(ageMonthC);
		p4.add(ageMonthL);
		p4.add(ageDayC);
		p4.add(ageDayL);

		phoneL = new JLabel("��ȭ��ȣ");
		tel2T = new JTextField(5);
		tel3T = new JTextField(5);
		JPanel p5 = new JPanel();
		p5.add(phoneL);
		p5.add(telC);
		p5.add(tel2T);
		p5.add(tel3T);

		emailL = new JLabel("e-mail");
		emailT = new JTextField(10);
		emailcomL = new JLabel("@");
		emailB = new JButton("����");
		JPanel p6 = new JPanel();
		p6.add(emailL);
		p6.add(emailT);
		p6.add(emailcomL);
		p6.add(emailC);
		p6.add(emailB);

		emailadductionL = new JLabel("e-mail ������ȣ");
		emailadductionT = new JTextField(10);
		emeilokB = new JButton("����Ȯ��");
		JPanel p7 = new JPanel();
		p7.add(emailadductionL);
		p7.add(emailadductionT);
		p7.add(emeilokB);

		joinB = new JButton("����");
		calneB = new JButton("���");
		JPanel p8 = new JPanel();
		p8.add(joinB);
		p8.add(calneB);

		JPanel p = new JPanel(new GridLayout(8, 1));
		p.add(p1);
		p.add(p2);
		p.add(p3);
		p.add(p4);
		p.add(p5);
		p.add(p6);
		p.add(p7);
		p.add(p8);

		JPanel joinp = new JPanel();
		joinp.add(joinB);
		joinp.add(calneB);

		Container contentPane = this.getContentPane();
		contentPane.add("Center", p);
		contentPane.add("South", joinp);

//		setVisible(true);
		setResizable(false);
		setBounds(400, 200, 1000, 800);
//		setDefaultCloseOperation(DO_NOTHING_ON_CLOSE);

	}

}

