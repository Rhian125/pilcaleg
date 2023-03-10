<?php

namespace App\Imports;

use App\Models\Pegawai;
use App\Models\Relawan;
use App\Models\RiwayatKepangkatan;
use App\Models\User;
use Illuminate\Support\Collection;
use Maatwebsite\Excel\Concerns\ToCollection;
use PhpOffice\PhpSpreadsheet\Shared\Date;
use Illuminate\Support\Facades\Hash;

class RelawanImport implements ToCollection
{
    public function collection(Collection $rows)
    {

        foreach ($rows as $row)
        {
            Relawan::create([
                'nip' => $row[0],
                'nama_pegawai' => $row[1]
            ]);

        }

    }
}
