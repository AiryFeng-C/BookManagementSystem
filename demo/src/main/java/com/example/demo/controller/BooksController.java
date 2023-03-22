package com.example.demo.controller;

import com.example.demo.crud.BooksRepository;
import com.example.demo.entity.Books;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.*;
import java.util.List;

@Controller
@RequestMapping("/book")
public class BooksController {

    @Autowired
    private BooksRepository booksRepository;

    //书籍展示页显示数据库书籍信息表中所有书籍信息功能
    @GetMapping("/list1")
    public String findAll1(Model model){
        List<Books> LIST = booksRepository.findAll();
        model.addAttribute("list",LIST);
        //跳转到书籍展示页
        return "list1";
    }

    //进入书籍详情页功能
    @GetMapping("/detail/{id}")
    public String detail(@PathVariable int id, Model model){
        Books book = booksRepository.findById(id).get();
        model.addAttribute("book",book);
        return "detail";
    }

    //书籍图片下载功能
    @GetMapping("/download/{filename}")
    public ResponseEntity<byte[]> download(@PathVariable String filename) throws IOException {
        String path = "D:/IdeaProjects/javamaven/demo/src/main/resources/static/image/"+filename;
        String fileType = "image/"+path.substring(path.lastIndexOf("."));
        File file = new File(path);
        InputStream inputStream = new FileInputStream(file);
        byte[] fileData = inputStream.readAllBytes();
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.valueOf(fileType));
        inputStream.close();
        return new ResponseEntity<>(fileData, headers, HttpStatus.OK );
    }

    //书籍信息分页查询功能
    @GetMapping("/findByPage/{page}")
    public String findByPage(@PathVariable int page, Model model){
        Pageable pageable = PageRequest.of(page,8);
        Page<Books> pageBook = booksRepository.findAll(pageable);
        model.addAttribute("pageBook",pageBook);
        //跳转到书籍信息页的具体页面
        return "list";
    }

    //添加书籍功能
    @GetMapping("/create")
    public String create(){
        return "create";
    }
    @PostMapping("/create1")
    public String create1(Books book, MultipartFile image, Model model, HttpServletRequest request) throws IOException {
        File file = new File("D:\\IdeaProjects\\javamaven\\demo\\src\\main\\resources\\static\\image",
                image.getOriginalFilename());
        if(image !=null && image.getSize() > 0 && !file.exists()){
            image.transferTo(file);
        } else if(file.exists()){
            Books book1 = new Books();
            book1.setName(request.getParameter("name"));
            book1.setWriter(request.getParameter("writer"));
            book1.setPublisher(request.getParameter("publisher"));
            book1.setUrl(request.getParameter("url"));
            model.addAttribute("book",book1);
            String error = "图片已经存在，请选择另一张图片";
            model.addAttribute("errorInfo",error);
            return "create";
        }
        booksRepository.save(book);
        return "redirect:/book/findByPage/0";
    }

    //删除书籍信息功能
    @GetMapping("/delete/{id}")
    public String delete(@PathVariable int id){
        Books book = booksRepository.findById(id).get();
        File file = new File("D:\\IdeaProjects\\javamaven\\demo\\src\\main\\resources\\static",book.getUrl());
        if(file.exists()){
            file.delete();
        }
        booksRepository.deleteById(id);
        return "redirect:/book/findByPage/0";
    }

    //修改书籍信息功能
    @GetMapping("/update/{id}")
    public String update(@PathVariable int id,Model model){
        Books book = booksRepository.findById(id).get();
        model.addAttribute("book",book);
        return "update";
    }
    @PostMapping ("/update")
    public String update1(Books book){
        booksRepository.save(book);
        return "redirect:/book/findByPage/0";
    }

    @RequestMapping("/hello")
    @ResponseBody
    public List<Books> hello(){
        List<Books> list = booksRepository.findAll();
        return list;
    }

    @RequestMapping("/hi")
    @ResponseBody
    public String strReturn(){
        return "向浏览器返回了一个字符串";
    }
}
