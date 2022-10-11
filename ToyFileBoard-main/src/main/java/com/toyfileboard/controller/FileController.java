package com.toyfileboard.controller;

import com.toyfileboard.model.File;
import com.toyfileboard.repository.FileRepository;
import com.toyfileboard.service.FileService;
import lombok.RequiredArgsConstructor;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.util.UriUtils;

import java.io.IOException;
import java.net.MalformedURLException;
import java.nio.charset.StandardCharsets;
import java.util.List;

@RequiredArgsConstructor
@Controller
public class FileController {

    private final FileService fileService;
    private final FileRepository fileRepository;

    @GetMapping("/file/upload")
    public String uploadForm() {

        return "fileUpload";
    }

    @PostMapping("/file/upload")
    public String uploadFile(@RequestParam("files") List<MultipartFile> files) throws IOException {
//        @RequestParam("file")MultipartFile file,
//        fileService.saveFile(file);

        for (MultipartFile multipartFile : files) {
            fileService.saveFile(multipartFile);
        }

        return "redirect:/file/listAll";
    }

    @GetMapping("/file/listAll")
    public String listAll(Model model) {

        List<File> files = fileRepository.findAll();
        model.addAttribute("all", files);
        return "fileView";
    }

    // image view
    @GetMapping("/file/image/{fileId}")
    @ResponseBody
    public Resource downloadImage(@PathVariable("fileId") Long id, Model model) throws IOException {

        File file = fileRepository.findById(id).orElse(null);
        return new UrlResource("file:" + file.getSavedPath());
    }

    // download
    @GetMapping("/file/attach/{id}")
    public ResponseEntity<Resource> downloadAttach(@PathVariable Long id) throws MalformedURLException {

        File file = fileRepository.findById(id).orElse(null);

        UrlResource resource = new UrlResource("file:" + file.getSavedPath());

        String encodedFileName = UriUtils.encode(file.getOrgNm(), StandardCharsets.UTF_8);

        // file download popup config
        String contentDisposition = "attachment; filename=\"" + encodedFileName + "\"";

        return ResponseEntity.ok().header(HttpHeaders.CONTENT_DISPOSITION, contentDisposition).body(resource);
    }

}
