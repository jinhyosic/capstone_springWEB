package com.toyfileboard.service;

import com.toyfileboard.model.File;
import com.toyfileboard.model.Member;
import com.toyfileboard.repository.FileRepository;
import com.toyfileboard.repository.MemberRepository;
import lombok.RequiredArgsConstructor;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.Optional;
import java.util.UUID;

@RequiredArgsConstructor
@Service
public class FileService {

    @Value("${file.dir}")
    private String fileDir;

    private final MemberRepository memberRepository;
    private final FileRepository fileRepository;

    public Long saveFile(MultipartFile files) throws IOException {
        if (files.isEmpty()) {
            return null;
        }

        String origName = files.getOriginalFilename();

        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String username = ((UserDetails) principal).getUsername();
        Optional<Member> memberWrapper = memberRepository.findByUsername(username);
        Member member = memberWrapper.get();
        String name = member.getName();

        String uuid = UUID.randomUUID().toString();

        String extension = origName.substring(origName.lastIndexOf("."));

        String savedName = uuid + extension;

        String savedPath = fileDir + savedName;

        File file = File.builder()
                .orgNm(origName)
                .name(name)
                .savedNm(savedName)
                .savedPath(savedPath)
                .build();

        files.transferTo(new java.io.File(savedPath));

        File savedFile = fileRepository.save(file);

        return savedFile.getId();
    }

}
