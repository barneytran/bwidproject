<?php

namespace App\Jobs;

use App\Mail\EMail;
use Illuminate\Bus\Queueable;
use Illuminate\Queue\SerializesModels;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;

class SendContactEmailJob implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;

    protected $input;



    /**
     * Create a new job instance.
     *
     * @return void
     */
    public function __construct($input)
    {
        $this->input = $input;
    }

    /**
     * Execute the job.
     *
     * @return void
     */
    public function handle()
    {
        //Send to visitor
        $email = new EMail();
        $email->subject = 'BWIDJSC Contact';
        $email->receiver_address = $this->input['email'];;
        $email->receiver_name = $this->input['name'];
        $email->body = [
            'view'=>'emails.contact2visitor',
            'content'=>[
                'input'=>$this->input
            ]
        ];
        sendMail($email);


        // Send to admin
        if ($this->input['subject'] === 'Employmenta' || $this->input['subject'] === 'Tuyển dụng'){
            $system_email = config('services.email.mail_hr');
            if ($system_email) {
                $email = new EMail();
                $email->subject = 'BWIDJSC Contact';
                $email->receiver_address = $system_email;
                $email->receiver_name = 'Admin';
                $email->body = [
                    'view'=>'emails.contact2admin',
                    'content'=>[
                        'input'=>$this->input
                    ]
                ];
                sendMail($email);
            }
        }else{
            $system_email = config('services.email.mail_admin');
            if ($system_email) {
                $email = new EMail();
                $email->subject = 'BWIDJSC Contact';
                $email->receiver_address = $system_email;
                $email->receiver_name = 'Admin';
                $email->body = [
                    'view'=>'emails.contact2admin',
                    'content'=>[
                        'input'=>$this->input
                    ]
                ];
                sendMail($email);
            }
        }
    }
}
