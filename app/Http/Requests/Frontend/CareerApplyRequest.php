<?php

namespace App\Http\Requests\Frontend;

use Illuminate\Foundation\Http\FormRequest;

class CareerApplyRequest extends FormRequest
{
    //public $redirect;

    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */

    public function rules()
    {
        return [
            'name' => 'required',
            'email' => 'required|email',
            'phone' => 'required|numeric|min:8',
            'content' => 'required|min:2|max:1024',
            'attach_file' => 'file|required',
            'g-recaptcha-response' => 'required|captcha'
        ];
    }

    public function messages()
    {
        return [
            'g-recaptcha-response.*' => trans('validation.recaptcha')
        ];
    }
}
