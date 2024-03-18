package com.galgoda.common.model.service;

import java.util.HashMap;
import java.util.Random;

import javax.servlet.http.HttpSession;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

public class CoolSmsSender {
    public static String generateVerificationCode() {
        // 랜덤한 4자리 숫자 생성
        Random random = new Random();
        int verificationCode = random.nextInt(10000); // 0부터 9999 사이의 랜덤한 숫자 생성
        return String.format("%04d", verificationCode); // 4자리로 맞추기 위해 포맷팅
    }

    public static String sendVerificationCode(String phone, HttpSession session) {
    	
        String apiKey = "NCSE1UPIQARMQTRY"; // 쿨에스엠스 API 키
        String apiSecret = "U6TCCAVJXUTKVLHJJDDOD9HEKSZ7QINA"; // 쿨에스엠스 API 시크릿 키

        Message coolsms = new Message(apiKey, apiSecret);

        // 발송할 메시지 내용 및 수신자 번호 설정
        String verificationCode = generateVerificationCode(); // 랜덤한 인증번호 생성
        String message = "인증번호는 [" + verificationCode + "]입니다."; // 발송할 메시지 내용
        HashMap<String, String> params = new HashMap<>();
        params.put("to", phone); // 수신자 번호
        // 발신자 번호는 서비스 제공업체에서 승인된 번호여야 함
        params.put("from", "01020153458"); // 발신자 번호 (본인의 발신자 번호로 설정해야 함)
        params.put("text", message); // 발송할 메시지 내용

        try {
            // 인증번호 발송 요청
            coolsms.send(params);
            session.setAttribute("sentCode", verificationCode);
            return verificationCode; // 생성된 인증번호 반환
        } catch (CoolsmsException e) {
            // 에러 발생 시 로그 출력
            e.printStackTrace();
            return null; // 실패 시 null 반환
        }
    }
}