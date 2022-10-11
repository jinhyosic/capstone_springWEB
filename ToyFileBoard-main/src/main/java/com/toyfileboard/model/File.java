package com.toyfileboard.model;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@NoArgsConstructor
@Table(name = "storage")
@Getter
@Entity
public class File {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "file_id")
    private Long id;
    private String orgNm;
    private String name;
    private String savedNm;
    private String savedPath;

    @Builder
    public File(Long id, String orgNm, String name, String savedNm, String savedPath) {
        this.id = id;
        this.orgNm = orgNm;
        this.name = name;
        this.savedNm = savedNm;
        this.savedPath = savedPath;
    }
}
