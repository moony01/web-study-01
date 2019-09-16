package Room;

import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.BufferedReader;
import java.io.PrintWriter;

import javax.swing.JButton;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;

import Action.Protocol;

public class DetailPanel extends JPanel implements ActionListener {

	public static String labelName[] = { "�� ��ȣ :", "      ", "�� ���� :", "      ", "�ο� �� : ", "      ", "�� ���� : ",
			"      ", "      " };
	public JLabel labelArray[]; // 1(���ȣ),3(������),5(�ο���),7(������)
	private JButton enterButton;

	private BufferedReader br;
	private PrintWriter pw;

	public DetailPanel(BufferedReader br, PrintWriter pw) {
		this.br = br;
		this.pw = pw;
	}

	public void init() {

		this.setLayout(new GridLayout(5, 2, 1, 1));

		labelArray = new JLabel[labelName.length];

		for (int i = 0; i < labelName.length; i++) {
			labelArray[i] = new JLabel(labelName[i]);
			this.add(labelArray[i]);
		}

		enterButton = new JButton("�� ��");
		this.add(enterButton);
		enterButton.addActionListener(this);
	}

	@Override
	public void actionPerformed(ActionEvent e) {
		System.out.println("�����ư ");
		if (e.getSource() == enterButton) {

			String count[] = labelArray[5].getText().split("/");

			if (count[0].compareTo(count[1]) == 0) {
				JOptionPane.showMessageDialog(this, "�ο��� �ʰ��� �� �� �����ϴ�");
			} else {
				// ������ �����û -> �� ID
				String line = "";
				line += (Protocol.ENTERROOM + "|" + labelArray[1].getText()); // Pro + ���ȣ
				pw.println(line);
				pw.flush();
			}
		}
	}

}