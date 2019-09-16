package user.action;

import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;

import user.bean.UserDTO;
import user.dao.UserDAO;

public class UserUpdateAction implements UserAction {

	@Override
	public void execute() {
		Scanner scan = new Scanner(System.in);
		
		System.out.print("수정할 아이디를 입력하세요 : ");
		String id = scan.next();
		
		UserDAO userDAO = UserDAO.getInstance();
		UserDTO userDTO = userDAO.getUser(id);
		
		if(userDTO==null) {
			System.out.println("수정할 아이디가 없습니다.");
			return;
		}
		System.out.println(userDTO.getName()+"\t"+userDTO.getId()+"\t"+userDTO.getPwd());
		
		System.out.println();
		System.out.print("수정할 이름을 입력하세요 : ");
		String name = scan.next();
		System.out.print("수정할 비밀번호를 입력하세요 : ");
		String pwd = scan.next();
		
		Map<String,String> map = new HashMap<String,String>();
		map.put("name", name);
		map.put("id", id);
		map.put("pwd", pwd);
		
		userDAO.update(map);
		
		System.out.println("데이터를 수정하였습니다");

	}

}












