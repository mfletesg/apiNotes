<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Models\Login;
use App\Http\Controllers\NoteController;
/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

// Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
//     return $request->user();
//
//
// });


Route::post('/login', function (Request $request) {
  $response = array('success' => false,'message' => 'Datos Incorrectos' );
  $usuario = $request->input('usuario');
  $password = $request->input('password');

  $Login = new Login();
  $user = $Login->checkLogin($usuario, $password);

  $IsLogin  = false;
  if (count($user) > 0) {
    $IsLogin  = true;
  }

  $response = array('success' => true,'message' => '', 'data' => $IsLogin);
  return json_encode($response);
});


Route::post('/createNote', [NoteController::class, 'store']);
