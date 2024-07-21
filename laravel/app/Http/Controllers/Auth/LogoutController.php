<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class LogoutController extends Controller
{
    /**
     * Handle the incoming request.
     */
    public function __invoke(Request $request)
    {
        // Retrieve the authenticated user
        $user = Auth::user();

        if ($user) {
            // Invalidate the remember_token by setting it to null
            $user->remember_token = null;
            $user->save();

            return response()->json(['message' => 'Logout successful'], 200);
        }

        return response()->json(['message' => 'User not authenticated'], 401);
    }
}
