package br.gov.sp.fatec.projetospring2k23.repository;
import org.springframework.data.jpa.repository.JpaRepository;
import br.gov.sp.fatec.projetospring2k23.entity.Usuario;
public interface UsuarioRepository extends JpaRepository<Usuario, Long>{
 
}
