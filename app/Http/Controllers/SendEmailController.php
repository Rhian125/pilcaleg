<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Mail\LaravelEmail;
use Illuminate\Support\Facades\Mail;

class SendEmailController extends Controller
{
    public function index(){
 
		$title = "Kirim Email";
        $view = view('admin.send_email.index', compact('title'));
        $view = $view->render();
        return $view;
 
	}
    
    public function send_email(Request $request){
 
        $this->validate($request, [
            'email_address' => 'email|required',
            'subject' => 'required',
            'message' => 'required'
        ]);

        $data = array(
            'email_address'      =>  $request->email_address,
            'subject'      =>  $request->subject,
            'message'   =>   $request->message
        );

        Mail::to($request->email_address)->send(new LaravelEmail($data));
        return back()->with('status', 'Pesan terkirim !');

	}
}
