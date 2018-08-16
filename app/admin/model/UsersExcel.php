<?php
/**
 * Created by PhpStorm.
 * User: Shinelon
 * Date: 2017/9/11
 * Time: 11:20
 */
namespace app\admin\model;
use think\Db;
use think\Model;
use think\Request;
use think\Loader;

class UsersExcel extends Model{
    public function daoc($tableheader,$data,$name) {
        if ($tableheader && $data && $name) {

            \think\Loader::import('PHPExcel.PHPExcel');
            \think\Loader::import('PHPExcel.IOFactory.PHPExcel_IOFactory');
            $objPHPExcel = new \PHPExcel();

            #Excel表格式
            $letter = array("A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "AA", "AB", "AC", "AD", "AE", "AF", "AG", "AH", "AI", "AJ", "AK", "AL", "AM", "AN", "AO", "AP", "AQ", "AR", "AS", "AT", "AU", "AV", "AW", "AX", "AY", "AZ");

            #填充表头信息
            for($i = 0;$i < count($tableheader);$i++) {
                $objPHPExcel->getActiveSheet()->setCellValue("$letter[$i]1","$tableheader[$i]");
            }

            #填充表格信息
            for ($i = 2;$i <= count($data) + 1;$i++) {
                $j = 0;
                foreach ($data[$i - 2] as $key=>$value) {
                $objPHPExcel->getActiveSheet()->setCellValue("$letter[$j]$i","$value");
                $j++;
                }
            }

            $write = \PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel5');
            ob_end_clean();
            header("Pragma: public");
            header("Expires: 0");
            header("Cache-Control:must-revalidate, post-check=0, pre-check=0");
            header("Content-Type:application/force-download");
            header("Content-Type:application/vnd.ms-execl");
            header("Content-Type:application/octet-stream");
            header("Content-Type:application/download");;
            header('Content-Disposition:attachment;filename="'.$name.'.xls"');
            header("Content-Transfer-Encoding:binary");
            $write->save('php://output');
        }
    }
    public function impost($filePath) {
        \think\Loader::import('PHPExcel.PHPExcel');
        \think\Loader::import('PHPExcel.IOFactory.PHPExcel_IOFactory');
        $PHPExcel = new \PHPExcel();

        #默认用excel2007读取excel，若格式不对，则用之前的版本进行读取 
        $PHPReader = new \PHPExcel_Reader_Excel2007();

        if (!$PHPReader->canRead($filePath)) {

            $PHPReader = new \PHPExcel_Reader_Excel5();
            if (!$PHPReader->canRead($filePath)) { 
                $arr['error_code'] = '1';
                $arr['msg'] = '文件错误，请重新上传！';
                return $arr;exit();
            }

        }

        $PHPExcel     = $PHPReader->load($filePath);
        //$return = $PHPExcel->getSheet(0)->toArray(null, true, true, true);
        
        #读取excel文件中的第一个工作表
        $currentSheet = $PHPExcel->getSheet(0);
        #取得最大的列号
        $allColumn    = $currentSheet->getHighestColumn(); 
        #取得一共有多少行
        $allRow       = $currentSheet->getHighestRow(); 
        #从第二行开始输出，因为excel表中第一行为列名
        
        $return = array();
        for($currentRow = 2;$currentRow <= $allRow;$currentRow++){
            $val          = array();
            for ($currentColumn= 'A';$currentColumn<=$allColumn; $currentColumn++) {
                $val[$currentColumn] = $currentSheet->getCellByColumnAndRow(ord($currentColumn) - 65,$currentRow)->getValue();
            }
            $return[] = $val;
        }
        return $return;
    }
}



?>

