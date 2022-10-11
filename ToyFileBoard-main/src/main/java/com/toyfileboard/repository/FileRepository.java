package com.toyfileboard.repository;

import com.toyfileboard.model.File;
import org.springframework.data.jpa.repository.JpaRepository;

public interface FileRepository extends JpaRepository<File, Long> {
}
