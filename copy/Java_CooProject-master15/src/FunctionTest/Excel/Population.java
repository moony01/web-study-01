//package FunctionTest.Excel;
//
//import java.io.FileInputStream;
//import java.io.IOException;
//
//import org.apache.poi.xssf.usermodel.XSSFCell;
//import org.apache.poi.xssf.usermodel.XSSFRow;
//import org.apache.poi.xssf.usermodel.XSSFSheet;
//import org.apache.poi.xssf.usermodel.XSSFWorkbook;
//
//public class Population {
//	public static void main(String[] args) throws IOException {
//		// ������ �б����� ���������� �����´�
//		FileInputStream fis = new FileInputStream("C:\\a.xlsx");
//		XSSFWorkbook workbook = new XSSFWorkbook(fis);
//		int rowindex = 0;
//		int columnindex = 0;
//		// ��Ʈ �� (ù��°���� �����ϹǷ� 0�� �ش�)
//		// ���� �� ��Ʈ�� �б����ؼ��� FOR���� �ѹ��� �����ش�
//		XSSFSheet sheet = workbook.getSheetAt(0);
//		// ���� ��
//		int rows = sheet.getPhysicalNumberOfRows();
//		for (rowindex = 1; rowindex < rows; rowindex++) {
//			// �����д´�
//			XSSFRow row = sheet.getRow(rowindex);
//			if (row != null) {
//				// ���� ��
//				int cells = row.getPhysicalNumberOfCells();
//				for (columnindex = 0; columnindex <= cells; columnindex++) {
//					// ������ �д´�
//					XSSFCell cell = row.getCell(columnindex);
//					String value = "";
//					// ���� ���ϰ�츦 ���� ��üũ
//					if (cell == null) {
//						continue;
//					} else {
//						// Ÿ�Ժ��� ���� �б�
//						switch (cell.getCellType()) {
//						case XSSFCell.CELL_TYPE_FORMULA:
//							value = cell.getCellFormula();
//							break;
//						case XSSFCell.CELL_TYPE_NUMERIC:
//							value = cell.getNumericCellValue() + "";
//							break;
//						case XSSFCell.CELL_TYPE_STRING:
//							value = cell.getStringCellValue() + "";
//							break;
//						case XSSFCell.CELL_TYPE_BLANK:
//							value = cell.getBooleanCellValue() + "";
//							break;
//						case XSSFCell.CELL_TYPE_ERROR:
//							value = cell.getErrorCellValue() + "";
//							break;
//						}
//					}
//					System.out.println("�� �� ���� :" + value);
//				}
//			}
//		}
//	}
//}
