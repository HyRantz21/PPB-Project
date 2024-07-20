<?php

namespace App\Http\Controllers\Auth;
use App\Models\User;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class LoginController extends Controller
{
    /**
     * Handle the incoming request.
     */
    public function __invoke(Request $request)
    {
        $credentials = $request->validate([
            'name' => 'required',
            'password' => 'required',
        ]);
      
       // Attempt to find the user
       $user = User::where('name', $request->name)->first();

       // If user is found and the password is correct
       if ($user) {
           $token = $user->createToken('LaravelAuthApp')->plainTextToken;
           User::where('name',$user->name)->update(['remember_token'=> $token]);
           return response()->json(['token' => $token], 200);
       } else {
           // If user is not found or password is incorrect
           return response()->json(['error' => 'Invalid name or password'], 401);
       }
       
    }
}
