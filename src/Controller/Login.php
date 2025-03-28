<?php
// src/Controller/Login.php
namespace App\Controller;
use App\Entity\Usuario;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Security\Http\Authentication\AuthenticationUtils;
use Symfony\Component\Security\Core\Security;

class Login extends AbstractController{

    /**
     * @Route("/login", name="login")
     */
    /* Este método 'login' verifica si el usuario existe. Si es así, inicia sesión.  */
    public function login(AuthenticationUtils $authenticationUtils, Security $security) {
        
        $error = $authenticationUtils->getLastAuthenticationError();
        $errorMessage = $error ? 'Usuario o contraseña incorrectos.' : null;
        $username = null; 
        $saldo = null; 
        $nombre = null; 

        if (!$error) {
            $user = $security->getUser();
            $username = $user ? $user->getUsername() : null;
            
            if ($user instanceof Usuario) {
                $entityManager = $this->getDoctrine()->getManager();
                $usuarioRepository = $entityManager->getRepository(Usuario::class);
                $saldo = $usuarioRepository->find($user->getIdUsuario())->getSaldo();
                $nombre = $usuarioRepository->find($user->getIdUsuario())->getNombre();
            }
        }
        return $this->render('login.html.twig', [
            'error'         => $errorMessage,
            'username'      => $username,
            'saldo'         => $saldo,
            'nombre'       => $nombre
            
            
        ]);
    }

    
}
