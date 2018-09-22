package api.excel;

import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.util.CellRangeAddress;
import org.springframework.web.servlet.view.document.AbstractExcelView;

import dto.PayDTO;

public class ListExcelDownload extends AbstractExcelView{

	@Override
	protected void buildExcelDocument(Map<String, Object> model, HSSFWorkbook workbook, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
        String sCurTime = null;
        sCurTime = new SimpleDateFormat("yyyy-MM-dd", Locale.KOREA).format(new Date());
     
        String excelName = sCurTime + "_결재.xls";  
        Sheet worksheet = null;
        Row row = null;
        CellStyle style = workbook.createCellStyle(); // 셀 스타일을 위한 변수
        style.setAlignment(CellStyle.ALIGN_CENTER); // 글 위치를 중앙으로 설정
         
        //List<MemDTO> listExcel = (List<MemDTO>) model.get("list");
        List<PayDTO> listExcel = (List<PayDTO>) model.get("list");
        
        // 새로운 sheet를 생성한다.
        worksheet = workbook.createSheet("엑셀 목록");
         
        // 가장 첫번째 줄에 제목을 만든다.
        row = worksheet.createRow(0);
         
        // 칼럼 길이 설정
        int columnIndex = 0;
        while (columnIndex < 11) {
            if(columnIndex == 0) {
                worksheet.setColumnWidth(columnIndex, 3000);
            } else if (columnIndex == 1) {
                worksheet.setColumnWidth(columnIndex, 3000);
            } else if (columnIndex == 2) {
                worksheet.setColumnWidth(columnIndex, 3000);
            } else if (columnIndex == 3) {
                worksheet.setColumnWidth(columnIndex, 3000);
            } else if (columnIndex == 4) {
                worksheet.setColumnWidth(columnIndex, 3000);
            } else if (columnIndex == 5) {
                worksheet.setColumnWidth(columnIndex, 3000);
            } else if (columnIndex == 6) {
                worksheet.setColumnWidth(columnIndex, 3000);
            } else if (columnIndex == 7) {
                worksheet.setColumnWidth(columnIndex, 3000);
            } else if (columnIndex == 8) {
                worksheet.setColumnWidth(columnIndex, 4000);
            } else if (columnIndex == 9) {
                worksheet.setColumnWidth(columnIndex, 14200);
            } else if (columnIndex == 10){
                worksheet.setColumnWidth(columnIndex, 4000);
            }
            columnIndex++;
        }
         
        // 헤더 설정
        row = worksheet.createRow(0);
        row.createCell(0).setCellValue("결제코드");
        row.createCell(1).setCellValue("상품이름");
        row.createCell(2).setCellValue("옵션");
        row.createCell(3).setCellValue("주문수량");
        row.createCell(4).setCellValue("개당 가격");
        row.createCell(5).setCellValue("결재된 가격");
        row.createCell(6).setCellValue("아이디");
        row.createCell(7).setCellValue("수령자 이름");
        row.createCell(8).setCellValue("수령자 연락처");
        row.createCell(9).setCellValue("주소");
        row.createCell(10).setCellValue("결제날짜");
         
        int rowIndex = 1;
        // 각 해당하는 셀에 값과 스타일을 넣음
        for(PayDTO dto : listExcel) {
            row = worksheet.createRow(rowIndex);
            row.createCell(0).setCellValue(dto.getPay_num());
            row.createCell(1).setCellValue(dto.getProd_name());
            row.createCell(2).setCellValue(dto.getGoods_color());
            row.createCell(3).setCellValue(dto.getPay_count());
            row.createCell(4).setCellValue(dto.getGoods_price());
            row.createCell(5).setCellValue(dto.getTotal_price());
            row.createCell(6).setCellValue(dto.getId());
            row.createCell(7).setCellValue(dto.getRec_name());
            row.createCell(8).setCellValue(dto.getRec_phone());
            row.createCell(9).setCellValue("("+dto.getZipcode()+")" + " " + dto.getAddr1() + dto.getAddr2());
            row.createCell(10).setCellValue(new SimpleDateFormat("yyyy-mm-dd").format(dto.getPay_date()));
            rowIndex++;
        }
        
        /*// 셀 병합 CellRangeAddress(시작 행, 끝 행, 시작 열, 끝 열)
        worksheet.addMergedRegion(new CellRangeAddress(listExcel.size() + 1, listExcel.size() + 1, 0, 9));
         
        // 병합 테스트를 위한 설정
        row = worksheet.createRow(listExcel.size() + 1);
        row.createCell(0).setCellValue("셀 병합 테스트");
        row.getCell(0).setCellStyle(style); // 지정한 스타일을 입혀준다.*/         
        try {
            response.setHeader("Content-Disposition", "attachement; filename=\""
                + java.net.URLEncoder.encode(excelName, "UTF-8") + "\";charset=\"UTF-8\"");
          } catch (UnsupportedEncodingException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
          }
	}

}
