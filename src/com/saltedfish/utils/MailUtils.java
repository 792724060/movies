package com.saltedfish.utils;

import java.util.Date;
import java.util.Properties;

import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 * 邮箱工具类
 * 用于激活用户账号
 * @author sa
 */
public class MailUtils {
	//发件人邮箱
    public static String myEmailAccount = "734273407@qq.com";
    //邮箱授权码
    public static String myEmailPassword = "wpwmibavijvabdgj";
    // qq邮箱的 SMTP 服务器地址为: smtp.qq.com
    public static String myEmailSMTPHost = "smtp.qq.com";
    
   /**
    * 发送邮箱
    * @param receiveMailAccount 收件人邮箱
    * @param code 邮箱激活码
    * @throws Exception 异常
    */
    public static void sendMail(String receiveMailAccount, String code) throws Exception{
    	//基本配置↓
    	Properties props = new Properties();
        props.setProperty("mail.transport.protocol", "smtp");   // 使用的协议（JavaMail规范要求）
        props.setProperty("mail.smtp.host", myEmailSMTPHost);   // 发件人的邮箱的 SMTP 服务器地址
        props.setProperty("mail.smtp.auth", "true");            // 需要请求认证
        //基本配置↑ 

        //根据配置创建会话对象, 用于和邮件服务器交互
        Session session = Session.getInstance(props);
        //设置为debug模式, 可以查看详细的发送log
        session.setDebug(true);
        //创建一封邮件
        MimeMessage message = new MimeMessage(session);
        //发件人
        message.setFrom(new InternetAddress(myEmailAccount, "深海迷航影院", "UTF-8"));
        //收件人
        message.setRecipient(MimeMessage.RecipientType.TO, new InternetAddress(receiveMailAccount));
        //邮件主题
        message.setSubject("您的 深海迷航影院 账户－请确认您的电子邮箱地址", "UTF-8");
        //邮件正文
        message.setContent("尊敬的"+"X先生/女士"+"：<div>要完成 深海迷航影院 的注册，请确认您的邮箱</div>"
        		+ "<div><br></div><a href='http://localhost:8080/movies/activate?code="+code+"'>点击激活</a>"
        		+ "<div><br></div>"
        		+ "<div>我们收到了一个使用您的电子邮箱地址创建 深海迷航影院 账户的请求。如果你没有提出此请求，那我们也没办法。</div>"
        		+ "<div>谢谢！</div>"
        		+ "<div>咸鱼 账户团队</div>", "text/html;charset=UTF-8");
       //设置发件时间
        message.setSentDate(new Date());
        //保存设置
        message.saveChanges();
        //根据 Session 获取邮件传输对象
        Transport transport = session.getTransport();
        //使用 邮箱账号 和 授权码 连接邮件服务器
        transport.connect(myEmailAccount, myEmailPassword);
        //发送邮件
        transport.sendMessage(message, message.getAllRecipients());
        //关闭连接
        transport.close();
    }
}