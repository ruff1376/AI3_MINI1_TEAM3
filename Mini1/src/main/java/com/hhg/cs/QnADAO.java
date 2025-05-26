package com.hhg.cs;

import com.hhg.cs.QnADTO;
import java.util.*;

public class QnADAO {
    private static final List<QnADTO> qnaList = new ArrayList<>();
    static {
        for (int i = 20; i >= 1; i--) {
            qnaList.add(new QnADTO(i, "문의 " + i, "작성자" + i, String.format("2024-05-%02d", i), ""));
        }
    }
    public static List<QnADTO> getAll() {
        return qnaList;
    }
    public static QnADTO getById(int id) {
        return qnaList.stream().filter(q -> q.getId() == id).findFirst().orElse(null);
    }
    public static void updateAnswer(int id, String answer) {
        QnADTO q = getById(id);
        if (q != null) q.setAnswer(answer);
    }
    public static int getTotal() {
        return qnaList.size();
    }
}
