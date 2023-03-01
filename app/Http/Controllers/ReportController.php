<?php

namespace App\Http\Controllers;

use App\Models\Pegawai;   //nama model
use App\Models\Opd;   //nama model
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB; //untuk membuat query di controller
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Database\Eloquent\Builder;
use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;
use PhpOffice\PhpSpreadsheet\Writer\Xls;
use PDF;

class ReportController extends Controller
{
    ## Tampilkan Data Search
    public function report_excel()
    {
        $spreadsheet = new Spreadsheet();
        $spreadsheet->setActiveSheetIndex(0);
        $sheet = $spreadsheet->getActiveSheet();

        $sheet->getColumnDimension('A')->setWidth(10);
		$sheet->getColumnDimension('B')->setWidth(22);
		$sheet->getColumnDimension('C')->setWidth(40);

        $sheet->setCellValue('A1', 'DATA PEGAWAI'); $sheet->mergeCells('A1:C1');
        $sheet->getStyle('A1:C1')->getAlignment()->setHorizontal(\PhpOffice\PhpSpreadsheet\Style\Alignment::HORIZONTAL_CENTER);
        
        $sheet->setCellValue('A3', 'NO');
        $sheet->setCellValue('B3', 'NIP');
        $sheet->setCellValue('C3', 'NAMA PEGAWAI');
        $rows = 4;
        $no = 1;
    
        $pegawai = Pegawai::where('status', 0)
                    ->where('status_hapus', 0)
                    ->get();
        
        foreach($pegawai as $v){
            $sheet->setCellValue('A' . $rows, $no++);
            $sheet->setCellValue('B' . $rows, $v->nip);
            $sheet->getStyle('B' . $rows)->getNumberFormat()->setFormatCode('0');
            $sheet->setCellValue('C' . $rows, $v->nama_pegawai);
            $rows++;
        }
        
        $sheet->getStyle('A3:C'.($rows-1))->getBorders()->getAllBorders()->setBorderStyle(\PhpOffice\PhpSpreadsheet\Style\Border::BORDER_THIN);
        $sheet->getStyle('A3:C'.($rows-1))->getAlignment()->setHorizontal(\PhpOffice\PhpSpreadsheet\Style\Alignment::HORIZONTAL_CENTER);
        
        $type = 'xlsx';
        $fileName = "DATA PEGAWAI.".$type;

        if($type == 'xlsx') {
            $writer = new Xlsx($spreadsheet);
        } else if($type == 'xls') {
            $writer = new Xls($spreadsheet);			
        }		
        $writer->save("public/upload/report/".$fileName);
        header("Content-Type: application/vnd.ms-excel");
        return redirect(url('/')."/public/upload/report/".$fileName);    

    }

    public function report_pdf()
    {
    	$pegawai = Pegawai::where('status', 0)
                    ->where('status_hapus', 0)
                    ->get();

       
    	$pdf = PDF::loadview('admin.report.report_pdf',[
                                'pegawai'=>$pegawai,
                            ])->setPaper('a4', 'landscape');
    	return $pdf->download('DATA PEGAWAI.pdf');
        // return view('admin.report.report_pdf', compact('pegawai'));

    }
}
