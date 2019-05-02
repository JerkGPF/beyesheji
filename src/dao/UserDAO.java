package dao;

import entity.student.CriterUser;
import entity.User;

import java.util.List;

public interface UserDAO {

    public List<User> getAll();

    public User get(String username);

    public void insert(User user);

    public void update(User user);

    public void delete(String username);

    /**
     * 返回和name相等的记录数
     * @param name
     * @return
     */
    public long getCountWithName(String username);

    public List<User> getForListWithCriterCustomer(CriterUser user);
}
